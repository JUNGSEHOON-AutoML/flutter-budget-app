import 'dart:async';
import 'dart:convert';

import 'package:account_book/data/entity/CategoryEntity.dart';
import 'package:account_book/data/entity/PaymentEntity.dart';
import 'package:shared_preferences/shared_preferences.dart';

/*
 * 웹 미리보기 전용 저장소
 * 웹에서는 sqflite(floor)와 Firebase Realtime Database를 쓸 수 없으므로
 * 카테고리, 결제 수단, 내역을 브라우저 localStorage에 저장한다.
 */
class WebPreviewStore {
  WebPreviewStore._();

  static final WebPreviewStore instance = WebPreviewStore._();

  static const _key = 'web_preview_store_v2';

  late SharedPreferences _prefs;

  var _categories = <int, CategoryEntity>{};
  var _payments = <int, PaymentEntity>{};
  var _history = <String, Map<String, Object?>>{};
  var _nextHistoryId = 0;

  final _categoriesController = StreamController<void>.broadcast();
  final _paymentsController = StreamController<void>.broadcast();
  final _historyController = StreamController<void>.broadcast();

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    final raw = _prefs.getString(_key);
    if (raw == null) {
      _seed();
      _save();
      return;
    }

    final json = jsonDecode(raw) as Map<String, dynamic>;
    _categories = {
      for (final e in json['categories'] as List)
        e['id'] as int: CategoryEntity(
            e['id'] as int, e['name'] as String, e['type'] as String,
            e['colorId'] as int)
    };
    _payments = {
      for (final e in json['payments'] as List)
        e['id'] as int: PaymentEntity(e['id'] as int, e['name'] as String)
    };
    _history = (json['history'] as Map<String, dynamic>).map(
        (key, value) => MapEntry(key, Map<String, Object?>.from(value as Map)));
    _nextHistoryId = json['nextHistoryId'] as int;
  }

  // 처음 실행했을 때 내역을 바로 추가해볼 수 있도록 기본 카테고리와 결제 수단만 넣는다.
  // id는 sqlite처럼 1부터 시작한다. (설정 화면이 payments[i + 1]로 접근)
  void _seed() {
    _categories = {
      1: CategoryEntity(1, '식비', 'spend', 0),
      2: CategoryEntity(2, '카페', 'spend', 5),
      3: CategoryEntity(3, '교통', 'spend', 10),
      4: CategoryEntity(4, '쇼핑', 'spend', 15),
      5: CategoryEntity(5, '용돈', 'income', 0),
      6: CategoryEntity(6, '아르바이트', 'income', 5),
    };
    _payments = {
      1: PaymentEntity(1, '체크카드'),
      2: PaymentEntity(2, '현금'),
    };
  }

  void _save() {
    _prefs.setString(
        _key,
        jsonEncode({
          'categories': _categories.values
              .map((e) => {
                    'id': e.id,
                    'name': e.name,
                    'type': e.type,
                    'colorId': e.colorId
                  })
              .toList(),
          'payments': _payments.values
              .map((e) => {'id': e.id, 'name': e.name})
              .toList(),
          'history': _history,
          'nextHistoryId': _nextHistoryId,
        }));
  }

  // floor의 Stream 쿼리처럼 구독 즉시 현재 값을 내보내고, 변경될 때마다 다시 내보낸다.
  Stream<T> _watch<T>(StreamController<void> controller, T Function() read) {
    late StreamController<T> out;
    StreamSubscription<void>? sub;
    out = StreamController<T>(onListen: () {
      out.add(read());
      sub = controller.stream.listen((_) => out.add(read()));
    }, onCancel: () => sub?.cancel());
    return out.stream;
  }

  int _newId(Iterable<int> ids) =>
      ids.isEmpty ? 1 : ids.reduce((a, b) => a > b ? a : b) + 1;

  // 카테고리
  Stream<List<CategoryEntity?>> getCategories() =>
      _watch(_categoriesController, () => _categories.values.toList());

  void putCategories(List<CategoryEntity> entities) {
    for (final e in entities) {
      final id = e.id ?? _newId(_categories.keys);
      _categories[id] = CategoryEntity(id, e.name, e.type, e.colorId);
    }
    _save();
    _categoriesController.add(null);
  }

  void deleteCategories(List<CategoryEntity> entities) {
    for (final e in entities) {
      _categories.remove(e.id);
    }
    _save();
    _categoriesController.add(null);
  }

  // 결제 수단
  Stream<List<PaymentEntity?>> getPayments() =>
      _watch(_paymentsController, () => _payments.values.toList());

  void putPayments(List<PaymentEntity> entities) {
    for (final e in entities) {
      final id = e.id ?? _newId(_payments.keys);
      _payments[id] = PaymentEntity(id, e.name);
    }
    _save();
    _paymentsController.add(null);
  }

  void deletePayments(List<PaymentEntity> entities) {
    for (final e in entities) {
      _payments.remove(e.id);
    }
    _save();
    _paymentsController.add(null);
  }

  // 내역 (Firebase에서처럼 date 순으로 정렬해서 내보낸다)
  Stream<List<MapEntry<String, Map<Object?, Object?>>>> getHistory() =>
      _watch(_historyController, () {
        final entries = _history.entries
            .map((e) => MapEntry<String, Map<Object?, Object?>>(e.key, e.value))
            .toList();
        entries.sort((a, b) =>
            (a.value['date'] as String).compareTo(b.value['date'] as String));
        return entries;
      });

  String addHistory(Map<String, Object?> row) {
    final key = 'record${_nextHistoryId++}';
    _history[key] = row;
    _save();
    _historyController.add(null);
    return key;
  }

  void updateHistory(String recordId, Map<String, Object?> fields) {
    _history[recordId]?.addAll(fields);
    _save();
    _historyController.add(null);
  }

  void deleteHistory(String recordId) {
    _history.remove(recordId);
    _save();
    _historyController.add(null);
  }
}

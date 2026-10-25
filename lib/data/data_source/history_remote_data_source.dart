import 'package:account_book/data/data_source/web_preview_store.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:get/get.dart';

enum DbColumn { uid, recordId, categoryId, type, paymentId, price, title, date }

class HistoryDataSource extends GetxService {
  // 웹 미리보기에서는 Firebase 대신 브라우저 저장소를 사용한다.
  final _web = WebPreviewStore.instance;

  FirebaseDatabase get _database => FirebaseDatabase.instance;

  Future<String?> addHistory(
      {required String uid,
      required int categoryId,
      required String type,
      required int paymentId,
      required int price,
      required String date,
      required String title}) async {
    final row = <String, Object>{
      DbColumn.uid.name: uid,
      DbColumn.categoryId.name: categoryId,
      DbColumn.type.name: type,
      DbColumn.paymentId.name: paymentId,
      DbColumn.date.name: date,
      DbColumn.price.name: price,
      DbColumn.title.name: title
    };

    if (kIsWeb) {
      return _web.addHistory(row);
    }

    final ref = _database.ref("history/$uid");
    final pushRef = ref.push();

    await pushRef.set(row);

    return pushRef.key;
  }

  void deleteHistory({required String uid, required String recordId}) {
    if (kIsWeb) {
      _web.deleteHistory(recordId);
      return;
    }

    final ref = _database.ref("history/$uid/$recordId");
    ref.set(null);
  }

  // key: recordId, value: 내역 데이터 (date 순으로 정렬)
  Future<Stream<List<MapEntry<String, Map<Object?, Object?>>>>> getHistory(
      {required String uid}) async {
    if (kIsWeb) {
      return _web.getHistory();
    }

    final ref = _database.ref("history/$uid").orderByChild(DbColumn.date.name);

    return ref.onValue.map((event) => event.snapshot.children
        .map((child) => MapEntry(
            child.key!, child.value as Map<Object?, Object?>))
        .toList());
  }

  void updateHistory(
      {required String uid,
      required String recordId,
      int? categoryId,
      String? date,
      String? type,
      int? paymentId,
      int? price,
      String? title}) {
    var map = <String, Object>{};

    if (categoryId != null) {
      map[DbColumn.categoryId.name] = categoryId;
    }

    if (type != null) {
      map[DbColumn.type.name] = type;
    }

    if (paymentId != null) {
      map[DbColumn.paymentId.name] = paymentId;
    }

    if (price != null) {
      map[DbColumn.price.name] = price;
    }

    if (title != null) {
      map[DbColumn.title.name] = title;
    }

    if (date != null) {
      map[DbColumn.date.name] = date;
    }

    if (kIsWeb) {
      _web.updateHistory(recordId, map);
      return;
    }

    final ref = _database.ref("history/$uid/$recordId");
    ref.update(map);
  }
}

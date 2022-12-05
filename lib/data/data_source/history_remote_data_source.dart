import 'package:account_book/domain/model/record.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

enum DbColumn { uid, recordId, categoryId, type, paymentId, price, title, date }

class HistoryDataSource extends GetxService {
  final _database = FirebaseDatabase.instance;

  Future<String?> addHistory(
      {required String uid,
      required int categoryId,
      required String type,
      required int paymentId,
      required int price,
      required String date,
      required String title}) async {
    final ref = _database.ref("history/$uid");
    final pushRef = ref.push();

    await pushRef.set({
      DbColumn.uid.name: uid,
      DbColumn.categoryId.name: categoryId,
      DbColumn.type.name: type,
      DbColumn.paymentId.name: paymentId,
      DbColumn.date.name: date,
      DbColumn.price.name: price,
      DbColumn.title.name: title
    });

    return pushRef.key;
  }

  void deleteHistories({required String uid, required List<String> recordIds}) {
    final Map<String, Record?> updates = {};

    for (final recordId in recordIds) {
      updates['/posts/$recordId'] = null;
    }

    FirebaseDatabase.instance.ref().update(updates);
  }

  Future<Stream<DatabaseEvent>> getHistory({required String uid}) async {
    final ref = _database.ref("history/$uid").orderByChild(DbColumn.date.name);

    return ref.onValue;
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

    final ref = _database.ref("history/$uid/$recordId");
    ref.update(map);
  }
}

import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

enum DbColumn { uid, recordId, categoryId, type, paymentId, price, title, date }

class HistoryDataSource extends GetxController {
  final database = FirebaseDatabase.instance;

  Future<String?> addHistory({required String uid,
    required int categoryId,
    required String type,
    required int paymentId,
    required int price,
    required String date,
    required String title}) async {
    final ref = database.ref("history/$uid");
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

  void deleteHistory({required String uid, required String recordId}) async {
    final ref = database.ref("history/$uid/$recordId");
    ref.update({});
  }

  Future<Iterable<DataSnapshot>> getHistory({required String uid}) async {
    final ref = database.ref("history/$uid").orderByChild(DbColumn.date.name);
    late final Iterable<DataSnapshot> list;
    ref.onValue.listen((event) {
       list = event.snapshot.children;
    });
    return list;
  }

  void updateHistory({required String uid,
    required String recordId,
    int? categoryId,
    String? date,
    String? type,
    int? paymentId,
    int? price,
    String? title}) {
    var map = <String, Object>{};

    if (categoryId != null) {
      map.update(DbColumn.categoryId.name, (value) => categoryId);
    }

    if (type != null) {
      map.update(DbColumn.type.name, (value) => type);
    }

    if (paymentId != null) {
      map.update(DbColumn.paymentId.name, (value) => paymentId);
    }

    if (price != null) {
      map.update(DbColumn.price.name, (value) => price);
    }

    if (title != null) {
      map.update(DbColumn.title.name, (value) => title);
    }

    if (date != null) {
      map.update(DbColumn.date.name, (value) => date);
    }

    final ref = database.ref("history/$uid/$recordId");
    ref.update(map);
  }
}

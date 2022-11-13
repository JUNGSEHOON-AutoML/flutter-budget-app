import 'dart:ffi';

import 'package:account_book/domain/model/payment.dart';
import 'package:account_book/domain/model/record.dart';
import 'package:firebase_database/firebase_database.dart';

class HistoryDataSource {
  final database = FirebaseDatabase.instance;

  @override
  Future<String?> addHistory(
      {required String uid,
      required int categoryId,
      required String type,
      required int paymentId,
      required int price,
      required String title}) async {
    final ref = database.ref("history/$uid");
    final pushRef = ref.push();

    await pushRef.set({
      {
        "uid": uid,
        "categoryId": categoryId,
        "type": type,
        "paymentId": paymentId,
        "price": price,
        "title": title
      }
    });

    return pushRef.key;
  }

  @override
  Future<void> deleteHistory() async {
    final ref = database.ref();
    await ref.update({});
  }

  @override
  Future<void> getHistory({required String uid}) async {
    final ref = database.ref("history/$uid");
    await ref.get();
  }

  @override
  void updateHistory() {
    // TODO: implement updateHistory
  }
}

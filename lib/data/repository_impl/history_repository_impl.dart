import 'package:account_book/data/data_source/history_data_source.dart';
import 'package:account_book/domain/repository/history_repository.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class HistoryRepositoryImpl extends GetxController
    implements HistoryRepository {
  final datasourceImpl = Get.put(HistoryDataSource());

  @override
  Future<String?> addHistory(
      {required String uid,
      required int categoryId,
      required String type,
      required int paymentId,
      required int price,
      required String date,
      required String title}) {
    return datasourceImpl.addHistory(
        uid: uid,
        categoryId: categoryId,
        type: type,
        paymentId: paymentId,
        price: price,
        date: date,
        title: title);
  }

  @override
  void deleteHistory({required String uid, required String recordId}) {
    return datasourceImpl.deleteHistory(uid: uid, recordId: recordId);
  }

  @override
  Future<Iterable<DataSnapshot>> getHistory({required String uid}) {
    return datasourceImpl.getHistory(uid: uid);
  }

  @override
  void updateHistory(
      {required String uid,
      required String recordId,
      int? categoryId,
      String? date,
      String? type,
      int? paymentId,
      int? price,
      String? title}) {
    return datasourceImpl.updateHistory(
        uid: uid,
        recordId: recordId,
        categoryId: categoryId,
        type: type,
        paymentId: paymentId,
        price: price,
        date: date,
        title: title);
  }
}

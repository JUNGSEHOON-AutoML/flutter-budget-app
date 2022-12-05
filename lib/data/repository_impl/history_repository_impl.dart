import 'package:account_book/data/data_source/history_remote_data_source.dart';
import 'package:account_book/domain/repository/history_repository.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class HistoryRepositoryImpl extends GetxService implements HistoryRepository {
  final _datasourceImpl = Get.put(HistoryDataSource());

  @override
  Future<String?> addHistory(
      {required String uid,
      required int categoryId,
      required String type,
      required int paymentId,
      required int price,
      required String date,
      required String title}) {
    return _datasourceImpl.addHistory(
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
    return _datasourceImpl.deleteHistory(uid: uid, recordId: recordId);
  }

  @override
  Future<Stream<DatabaseEvent>> getHistory(
      {required String uid}) {
    return _datasourceImpl.getHistory(uid: uid);
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
    return _datasourceImpl.updateHistory(
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

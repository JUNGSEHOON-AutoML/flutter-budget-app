import 'package:account_book/data/entity/CategoryEntity.dart';
import 'package:account_book/data/entity/PaymentEntity.dart';
import 'package:account_book/application/my_service.dart';
import 'package:account_book/data/data_source/web_preview_store.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:get/get.dart';

class PropertiesLocalDataSource extends GetxService {
  final _databaseController = MyService.to;

  // 웹 미리보기에서는 sqflite 대신 브라우저 저장소를 사용한다.
  final _web = WebPreviewStore.instance;

  Future<Stream<List<CategoryEntity?>>> getCategories() async {
    if (kIsWeb) {
      return _web.getCategories();
    }
    final database = _databaseController.localDatabase;
    return database.categoryDao.getCategories();
  }

  Future<void> addCategory({required List<CategoryEntity> categories}) async {
    if (kIsWeb) {
      return _web.putCategories(categories);
    }
    final database = await _databaseController.localDatabase;
    database.categoryDao.insertCategories(categories);
  }

  Future<void> updateCategory(
      {required List<CategoryEntity> categories}) async {
    if (kIsWeb) {
      return _web.putCategories(categories);
    }
    final database = await _databaseController.localDatabase;
    database.categoryDao.updateCategories(categories);
  }

  Future<void> deleteCategory(
      {required List<CategoryEntity> categories}) async {
    if (kIsWeb) {
      return _web.deleteCategories(categories);
    }
    final database = await _databaseController.localDatabase;
    database.categoryDao.deleteCategories(categories);
  }

  Future<Stream<List<PaymentEntity?>>> getPayments() async {
    if (kIsWeb) {
      return _web.getPayments();
    }
    final database = await _databaseController.localDatabase;
    return database.paymentDao.getPayments();
  }

  Future<void> addPayment({required List<PaymentEntity> payments}) async {
    if (kIsWeb) {
      return _web.putPayments(payments);
    }
    final database = await _databaseController.localDatabase;
    database.paymentDao.insertPayment(payments);
  }

  Future<void> updatePayment({required List<PaymentEntity> payments}) async {
    if (kIsWeb) {
      return _web.putPayments(payments);
    }
    final database = await _databaseController.localDatabase;
    database.paymentDao.updatePayment(payments);
  }

  Future<void> deletePayment({required List<PaymentEntity> payments}) async {
    if (kIsWeb) {
      return _web.deletePayments(payments);
    }
    final database = await _databaseController.localDatabase;
    database.paymentDao.deletePayment(payments);
  }
}

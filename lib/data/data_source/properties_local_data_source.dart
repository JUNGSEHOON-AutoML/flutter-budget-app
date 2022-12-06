import 'package:account_book/data/entity/CategoryEntity.dart';
import 'package:account_book/data/entity/PaymentEntity.dart';
import 'package:account_book/application/my_service.dart';
import 'package:get/get.dart';

class PropertiesLocalDataSource extends GetxService {
  final _databaseController = MyService.to;

  Future<Stream<List<CategoryEntity?>>> getCategories() async {
    final database = _databaseController.localDatabase;
    return database.categoryDao.getCategories();
  }

  Future<void> addCategory({required List<CategoryEntity> categories}) async {
    final database = await _databaseController.localDatabase;
    database.categoryDao.insertCategories(categories);
  }

  Future<void> updateCategory(
      {required List<CategoryEntity> categories}) async {
    final database = await _databaseController.localDatabase;
    database.categoryDao.updateCategories(categories);
  }

  Future<void> deleteCategory(
      {required List<CategoryEntity> categories}) async {
    final database = await _databaseController.localDatabase;
    database.categoryDao.deleteCategories(categories);
  }

  Future<Stream<List<PaymentEntity?>>> getPayments() async {
    final database = await _databaseController.localDatabase;
    return database.paymentDao.getPayments();
  }

  Future<void> addPayment({required List<PaymentEntity> payments}) async {
    final database = await _databaseController.localDatabase;
    database.paymentDao.insertPayment(payments);
  }

  Future<void> updatePayment({required List<PaymentEntity> payments}) async {
    final database = await _databaseController.localDatabase;
    database.paymentDao.updatePayment(payments);
  }

  Future<void> deletePayment({required List<PaymentEntity> payments}) async {
    final database = await _databaseController.localDatabase;
    database.paymentDao.deletePayment(payments);
  }
}

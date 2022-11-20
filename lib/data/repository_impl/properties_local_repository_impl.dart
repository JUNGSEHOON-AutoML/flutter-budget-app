import 'package:account_book/data/data_source/properties_local_data_source.dart';
import 'package:account_book/data/entity/CategoryEntity.dart';
import 'package:account_book/data/entity/PaymentEntity.dart';
import 'package:account_book/domain/model/category.dart';
import 'package:account_book/domain/model/payment.dart';
import 'package:account_book/domain/repository/properties_local_repository.dart';
import 'package:get/get.dart';

class PropertiesLocalRepositoryImpl extends GetxService
    implements PropertiesRepository {
  final _dataSource = Get.put(PropertiesLocalDataSource());

  @override
  Future<void> addCategory({required List<Category> categories}) {
    return _dataSource.addCategory(
        categories: categories.map((e) => e.toEntity()).toList());
  }

  @override
  Future<void> addPayment({required List<Payment> payments}) {
    return _dataSource.addPayment(
        payments: payments.map((e) => e.toEntity()).toList());
  }

  @override
  Future<void> deleteCategory({required List<Category> categories}) {
    return _dataSource.deleteCategory(
        categories: categories.map((e) => e.toEntity()).toList());
  }

  @override
  Future<void> deletePayment({required List<Payment> payments}) {
    return _dataSource.deletePayment(
        payments: payments.map((e) => e.toEntity()).toList());
  }

  @override
  Future<Stream<List<CategoryEntity?>>> getCategories() {
    return _dataSource.getCategories();
  }

  @override
  Future<Stream<List<PaymentEntity?>>> getPayments() {
    return _dataSource.getPayments();
  }

  @override
  Future<void> updateCategory({required List<Category> categories}) {
    return _dataSource.updateCategory(
        categories: categories.map((e) => e.toEntity()).toList());
  }

  @override
  Future<void> updatePayment({required List<Payment> payments}) {
    return _dataSource.updatePayment(
        payments: payments.map((e) => e.toEntity()).toList());
  }
}

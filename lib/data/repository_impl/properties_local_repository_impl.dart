import 'package:account_book/data/data_source/properties_local_data_source.dart';
import 'package:account_book/data/entity/CategoryEntity.dart';
import 'package:account_book/domain/model/category.dart';
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
  void addPayment({required String name, required int colorId}) {
    // TODO: implement addPayment
  }

  @override
  Future<void> deleteCategory({required List<Category> categories}) {
    return _dataSource.deleteCategory(
        categories: categories.map((e) => e.toEntity()).toList());
  }

  @override
  void deletePayment({required int paymentId}) {
    // TODO: implement deletePayment
  }

  @override
  Future<Stream<List<CategoryEntity?>>> getCategories() {
    return _dataSource.getCategories();
  }

  @override
  void getPayment() {
    // TODO: implement getPayment
  }

  @override
  Future<void> updateCategory({required List<Category> categories}) {
    return _dataSource.updateCategory(
        categories: categories.map((e) => e.toEntity()).toList());
  }

  @override
  void updatePayment({required int paymentId, String? name, int? colorId}) {
    // TODO: implement updatePayment
  }
}

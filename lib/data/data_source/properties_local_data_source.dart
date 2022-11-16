import 'package:account_book/data/entity/CategoryEntity.dart';
import 'package:account_book/di/category_controller.dart';
import 'package:account_book/di/floor_controller.dart';
import 'package:account_book/di/payment_controller.dart';
import 'package:get/get.dart';

class PropertiesLocalDataSource extends GetxController {
  final _databaseController = Get.put(FloorController());

  Future<Stream<List<CategoryEntity?>>> getCategories() async {
    final test = await _databaseController.database;
    final a = test.categoryDao.getCategories();
    return a;
  }

  void addCategory(
      {required String name, required String type, required int colorId}) {}

  void updateCategory(
      {required int categoryId, String? name, String? type, int? colorId}) {}

  void deleteCategory({required int categoryId}) {}

  void getPayment() {}

  void addPayment({required String name, required int colorId}) {}

  void updatePayment({required int paymentId, String? name, int? colorId}) {}

  void deletePayment({required int paymentId}) {}
}

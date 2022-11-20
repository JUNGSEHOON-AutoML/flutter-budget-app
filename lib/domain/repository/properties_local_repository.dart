import 'package:account_book/domain/model/category.dart';

class PropertiesRepository {
  void getCategories() {}

  void addCategory(
      {required List<Category> categories}) {}

  void updateCategory(
      {required List<Category> categories}) {}

  void deleteCategory({required List<Category> categories}) {}

  void getPayment() {}

  void addPayment({required String name, required int colorId}) {}

  void updatePayment({required int paymentId, String? name, int? colorId}) {}

  void deletePayment({required int paymentId}) {}
}

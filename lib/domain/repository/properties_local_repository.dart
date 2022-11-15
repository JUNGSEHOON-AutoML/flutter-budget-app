class PropertiesRepository {
  void getCategories() {}

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

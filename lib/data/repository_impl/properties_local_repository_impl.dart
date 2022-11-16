import 'package:account_book/data/data_source/properties_local_data_source.dart';
import 'package:account_book/data/entity/CategoryEntity.dart';
import 'package:account_book/domain/repository/properties_local_repository.dart';
import 'package:get/get.dart';

class PropertiesLocalRepositoryImpl extends GetxController
    implements PropertiesRepository {
  final _dataSource = Get.put(PropertiesLocalDataSource());

  @override
  void addCategory(
      {required String name, required String type, required int colorId}) {
    // TODO
  }

  @override
  void addPayment({required String name, required int colorId}) {
    // TODO: implement addPayment
  }

  @override
  void deleteCategory({required int categoryId}) {
    // TODO: implement deleteCategory
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
  void updateCategory(
      {required int categoryId, String? name, String? type, int? colorId}) {
    // TODO: implement updateCategory
  }

  @override
  void updatePayment({required int paymentId, String? name, int? colorId}) {
    // TODO: implement updatePayment
  }
}

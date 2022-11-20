import 'package:account_book/data/repository_impl/properties_local_repository_impl.dart';
import 'package:account_book/domain/model/category.dart';
import 'package:get/get.dart';

class AddCategoryUseCase extends GetxService {
  final _repository = Get.put(PropertiesLocalRepositoryImpl());

  void invoke(Category category) async {
    _repository.addCategory(categories: [category]);
  }
}

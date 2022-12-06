import 'package:account_book/data/repository_impl/properties_local_repository_impl.dart';
import 'package:account_book/application/my_service.dart';
import 'package:account_book/domain/model/category.dart';
import 'package:get/get.dart';

class GetCategoriesUseCase extends GetxController {
  final _repository = Get.put(PropertiesLocalRepositoryImpl());

  Future<void> invoke() async {
    (await _repository.getCategories()).listen((event) {
      final newCategories = <int, Category>{};

      for (final entity in event) {
        if (entity != null) {
          final newCategory = entity.toModel();
          newCategories[newCategory.id] = newCategory;
        }
      }

      MyService.to.categories.clear();
      MyService.to.initCategory();
      MyService.to.categories.addAll(newCategories);
    });
  }
}

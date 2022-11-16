import 'package:account_book/data/repository_impl/properties_local_repository_impl.dart';
import 'package:account_book/di/category_controller.dart';
import 'package:account_book/di/color_controller.dart';
import 'package:account_book/domain/model/category.dart';
import 'package:account_book/domain/model/record.dart';
import 'package:get/get.dart';

class GetCategoriesUseCase extends GetxController {
  final _repository = Get.put(PropertiesLocalRepositoryImpl());
  final _colorController = Get.put(ColorController());
  final _categoryController = Get.put(CategoryController());

  Future<void> invoke() async {
    (await _repository.getCategories()).listen((event) {
      for (final entity in event) {
        if (entity != null) {
          final newCategory = Category();
          newCategory.id = entity.id;
          newCategory.name = entity.name;
          newCategory.type = RecordType.income;
          if (entity.type == RecordType.spend.name) {
            newCategory.type = RecordType.spend;
          }
          newCategory.color = _colorController.getColorById(
              type: newCategory.type, id: entity.colorId);

          _categoryController.categories[newCategory.id] = newCategory;
        }
      }
    });
  }
}

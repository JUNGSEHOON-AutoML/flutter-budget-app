import 'package:account_book/domain/model/category.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  final categories = <int, Category>{};

  CategoryController() {
    final unKnownCategory = Category();
    unKnownCategory.id = -1;
    unKnownCategory.name = "Unknown";

    categories[unKnownCategory.id] = unKnownCategory;
  }
}

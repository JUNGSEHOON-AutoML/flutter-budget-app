import 'package:account_book/application/my_service.dart';
import 'package:account_book/domain/model/category.dart';
import 'package:account_book/domain/model/record.dart';
import 'package:floor/floor.dart';

@entity
class CategoryEntity {
  @primaryKey
  final int? id;
  late final String name;
  late final String type;
  late final int colorId;

  CategoryEntity(this.id, this.name, this.type, this.colorId);

  Category toModel() {
    final newCategory = Category();
    if (id == null) {
      newCategory.id = -1;
    } else {
      newCategory.id = id!;
    }
    newCategory.name = name;
    newCategory.type = RecordType.income;
    if (type == RecordType.spend.name) {
      newCategory.type = RecordType.spend;
    }
    newCategory.color =
        MyService.to.getColorById(type: newCategory.type, id: colorId);

    return newCategory;
  }
}

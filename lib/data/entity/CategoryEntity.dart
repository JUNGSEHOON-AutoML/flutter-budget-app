import 'package:floor/floor.dart';

@entity
class CategoryEntity {
  @primaryKey
  late final int id;
  late final String name;
  late final String type;
  late final int colorId;

  CategoryEntity(this.id, this.name, this.type, this.colorId);
}

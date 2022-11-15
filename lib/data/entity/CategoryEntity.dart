import 'package:floor/floor.dart';

@entity
class CategoryEntity {
  @primaryKey
  late final int id;
  late final String name;
  late final String type;

  CategoryEntity(this.id, this.name, this.type);
}

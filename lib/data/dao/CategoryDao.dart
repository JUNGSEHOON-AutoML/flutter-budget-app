import 'package:account_book/data/entity/CategoryEntity.dart';
import 'package:floor/floor.dart';

@dao
abstract class CategoryDao {
  @Query('SELECT * FROM Category')
  Stream<List<CategoryEntity?>> getCategories();

  @insert
  Future<void> insertCategories(List<CategoryEntity> categoryEntities);

  @update
  Future<void> updateCategories(List<CategoryEntity> categoryEntities);

  @delete
  Future<void> deleteCategories(List<CategoryEntity> categoryEntities);
}

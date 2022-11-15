import 'package:account_book/data/entity/CategoryEntity.dart';
import 'package:account_book/domain/model/payment.dart';
import 'package:floor/floor.dart';
import 'package:get/get.dart';

@dao
abstract class CategoryDao {
  @Query('SELECT * FROM Category')
  Stream<Payment?> getPayments();

  @insert
  Future<void> insertPayment(CategoryEntity categoryEntity);

  @update
  Future<void> updatePayment(CategoryEntity categoryEntity);

  @Query('DELETE FROM Category WHERE id = :categoryId')
  Future<void> deletePayment({required int categoryId});
}

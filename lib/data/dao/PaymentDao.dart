import 'package:account_book/data/entity/PaymentEntity.dart';
import 'package:floor/floor.dart';

@dao
abstract class PaymentDao {
  @Query('SELECT * FROM Payment')
  Stream<List<PaymentEntity?>> getPayments();

  @insert
  Future<void> insertPayment(List<PaymentEntity> paymentEntities);

  @update
  Future<void> updatePayment(List<PaymentEntity> paymentEntities);

  @delete
  Future<void> deletePayment(List<PaymentEntity> paymentEntities);
}

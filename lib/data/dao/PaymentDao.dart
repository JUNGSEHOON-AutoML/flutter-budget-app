import 'package:account_book/data/entity/PaymentEntity.dart';
import 'package:account_book/domain/model/payment.dart';
import 'package:floor/floor.dart';

@dao
abstract class PaymentDao {
  @Query('SELECT * FROM Payment')
  Stream<Payment?> getPayments();

  @insert
  Future<void> insertPayment(PaymentEntity paymentEntity);

  @update
  Future<void> updatePayment(PaymentEntity paymentEntity);

  @Query('DELETE FROM Payment WHERE id = :paymentId')
  Future<void> deletePayment({required int paymentId});
}

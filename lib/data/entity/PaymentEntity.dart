import 'package:account_book/domain/model/payment.dart';
import 'package:floor/floor.dart';

@entity
class PaymentEntity {
  @primaryKey
  final int? id;
  late final String name;

  PaymentEntity(this.id, this.name);

  Payment toModel() {
    final payment = Payment();
    if (id == null) {
      payment.id = -1;
    } else {
      payment.id = id!;
    }
    payment.name = name;
    return payment;
  }
}

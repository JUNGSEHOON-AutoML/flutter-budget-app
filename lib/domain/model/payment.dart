import 'package:account_book/data/entity/PaymentEntity.dart';

class Payment {
  late final int id;
  late final String name;

  PaymentEntity toEntity() {
    return PaymentEntity(id, name);
  }
}

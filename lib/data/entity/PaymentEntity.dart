import 'package:floor/floor.dart';

@entity
class PaymentEntity {
  @primaryKey
  final int? id;
  late final String name;

  PaymentEntity(this.id, this.name);
}

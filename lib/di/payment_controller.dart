import 'package:account_book/domain/model/payment.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController {
  final payments = <int, Payment>{};

  PaymentController() {
    final unknownPayment = Payment();
    unknownPayment.id = -1;
    unknownPayment.name = "Unknown";

    payments[unknownPayment.id] = unknownPayment;
  }
}

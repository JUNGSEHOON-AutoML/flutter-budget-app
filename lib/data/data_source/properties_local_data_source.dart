import 'package:account_book/di/category_controller.dart';
import 'package:account_book/di/payment_controller.dart';
import 'package:get/get.dart';

class PropertiesLocalDataSource extends GetxController {
  final paymentController = Get.lazyPut(() => PaymentController());
  final categoryController = Get.lazyPut(() => CategoryController());
}

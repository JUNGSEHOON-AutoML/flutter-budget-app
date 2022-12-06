import 'package:account_book/data/repository_impl/properties_local_repository_impl.dart';
import 'package:account_book/application/my_service.dart';
import 'package:account_book/domain/model/payment.dart';
import 'package:get/get.dart';

class GetPaymentsUseCase extends GetxController {
  final _repository = Get.put(PropertiesLocalRepositoryImpl());

  Future<void> invoke() async {
    (await _repository.getPayments()).listen((event) {
      final newPayments = <int, Payment>{};
      for (final entity in event) {
        if (entity != null) {
          final newPayment = entity.toModel();
          newPayments[newPayment.id!] = newPayment;
        }
      }
      MyService.to.payments.clear();
      MyService.to.initPayment();
      MyService.to.payments.addAll(newPayments);
    });
  }
}

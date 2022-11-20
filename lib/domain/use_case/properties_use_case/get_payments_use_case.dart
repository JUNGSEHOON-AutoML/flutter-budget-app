import 'package:account_book/data/repository_impl/properties_local_repository_impl.dart';
import 'package:account_book/di/my_service.dart';
import 'package:get/get.dart';

class GetPaymentsUseCase extends GetxController {
  final _repository = Get.put(PropertiesLocalRepositoryImpl());

  Future<void> invoke() async {
    (await _repository.getPayments()).listen((event) {
      for (final entity in event) {
        if (entity != null) {
          final newPayment = entity.toModel();
          MyService.to.payments[newPayment.id] = newPayment;
        }
      }
    });
  }
}

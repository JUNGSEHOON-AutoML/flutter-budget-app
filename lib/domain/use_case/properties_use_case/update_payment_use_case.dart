import 'package:account_book/data/repository_impl/properties_local_repository_impl.dart';
import 'package:account_book/domain/model/payment.dart';
import 'package:get/get.dart';

class UpdatePaymentUseCase extends GetxService {
  final _repository = Get.put(PropertiesLocalRepositoryImpl());

  void invoke(Payment payment) async {
    _repository.updatePayment(payments: [payment]);
  }
}

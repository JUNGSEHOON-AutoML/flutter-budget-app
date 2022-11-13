import 'package:account_book/data/repository_impl/history_repository_impl.dart';
import 'package:account_book/domain/model/me_controller.dart';
import 'package:get/get.dart';

class UpdateRecordUseCase extends GetxController {
  final _repository = Get.put(HistoryRepositoryImpl());
  final _meController = Get.put(MeController());

  void invoke(
      {required String recordId,
      int? categoryId,
      String? date,
      String? type,
      int? paymentId,
      int? price,
      String? title}) {
    _repository.updateHistory(
        uid: _meController.me.uid,
        recordId: recordId,
        categoryId: categoryId,
        type: type,
        paymentId: paymentId,
        price: price,
        date: date,
        title: title);
  }
}

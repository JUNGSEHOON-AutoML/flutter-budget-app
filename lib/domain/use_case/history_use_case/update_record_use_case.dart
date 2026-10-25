import 'package:account_book/data/repository_impl/history_repository_impl.dart';
import 'package:account_book/application/my_service.dart';
import 'package:get/get.dart';

class UpdateRecordUseCase extends GetxService {
  final _repository = Get.put(HistoryRepositoryImpl());

  void invoke(
      {required String recordId,
      int? categoryId,
      String? date,
      String? type,
      int? paymentId,
      int? price,
      String? title}) {
    _repository.updateHistory(
        uid: MyService.to.uid,
        recordId: recordId,
        categoryId: categoryId,
        type: type,
        paymentId: paymentId,
        price: price,
        date: date,
        title: title);
  }
}

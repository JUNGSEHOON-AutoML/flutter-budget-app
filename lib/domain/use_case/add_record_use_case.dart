import 'package:account_book/data/repository_impl/history_repository_impl.dart';
import 'package:account_book/domain/model/category.dart';
import 'package:account_book/domain/model/me_controller.dart';
import 'package:account_book/domain/model/payment.dart';
import 'package:account_book/domain/model/record.dart';
import 'package:get/get.dart';

class AddRecordUseCase extends GetxController {
  final _repository = Get.put(HistoryRepositoryImpl());
  final _meController = Get.put(MeController());

  Future<void> invoke(
      {required Category category,
      required RecordType type,
      required Payment payment,
      required int price,
      required String date,
      required String title}) async {
    var newKey = await _repository.addHistory(
        uid: _meController.me.uid,
        categoryId: category.id,
        type: type.name,
        paymentId: payment.id,
        price: price,
        date: date,
        title: title);

    // TODO newKey로 List에 넣어주기..
  }
}

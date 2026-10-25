import 'package:account_book/data/repository_impl/history_repository_impl.dart';
import 'package:account_book/application/my_service.dart';
import 'package:account_book/domain/model/category.dart';
import 'package:account_book/domain/model/payment.dart';
import 'package:account_book/domain/model/record.dart';
import 'package:get/get.dart';

class AddRecordUseCase extends GetxService {
  final _repository = Get.put(HistoryRepositoryImpl());

  Future<void> invoke(
      {required Category category,
      required RecordType type,
      required Payment payment,
      required int price,
      required String date,
      required String title}) async {
    var newKey = await _repository.addHistory(
        uid: MyService.to.uid,
        categoryId: category.id!,
        type: type.name,
        paymentId: payment.id!,
        price: price,
        date: date,
        title: title);
  }
}

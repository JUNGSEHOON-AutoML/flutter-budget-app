import 'package:account_book/data/repository_impl/history_repository_impl.dart';
import 'package:account_book/di/my_service.dart';
import 'package:get/get.dart';

class DeleteRecordsUseCase extends GetxService {
  final _repository = Get.put(HistoryRepositoryImpl());

  void invoke({required List<String> recordIds}) {
    _repository.deleteHistories(uid: MyService.to.me.uid, recordIds: recordIds);
  }
}

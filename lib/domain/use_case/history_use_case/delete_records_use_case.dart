import 'package:account_book/data/repository_impl/history_repository_impl.dart';
import 'package:account_book/application/my_service.dart';
import 'package:get/get.dart';

class DeleteRecordUseCase extends GetxService {
  final _repository = Get.put(HistoryRepositoryImpl());

  void invoke({required String recordId}) {
    _repository.deleteHistory(uid: MyService.to.uid, recordId: recordId);
  }
}

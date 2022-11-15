import 'package:account_book/data/repository_impl/history_repository_impl.dart';
import 'package:account_book/di/me_controller.dart';
import 'package:get/get.dart';

class DeleteRecordUseCase extends GetxController {
  final _repository = Get.put(HistoryRepositoryImpl());
  final _meController = Get.put(MeController());

  void invoke({required String recordId}) {
    _repository.deleteHistory(uid: _meController.me.uid, recordId: recordId);
  }
}

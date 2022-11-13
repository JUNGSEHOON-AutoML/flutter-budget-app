import 'dart:collection';

import 'package:account_book/data/data_source/history_data_source.dart';
import 'package:account_book/data/repository_impl/history_repository_impl.dart';
import 'package:account_book/domain/model/category.dart';
import 'package:account_book/domain/model/history_controller.dart';
import 'package:account_book/domain/model/me_controller.dart';
import 'package:account_book/domain/model/record.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class GetHistoryUseCase extends GetxController {
  final _repository = Get.put(HistoryRepositoryImpl());
  final _meController = Get.put(MeController());
  final _historyController = Get.put(HistoryController());

  void invoke() async {
    _historyController.history["test"] = [];

    _repository.getHistory(
        uid: _meController.me.uid,
        onSuccess: (DatabaseEvent event) {
          for (final child in event.snapshot.children) {
            final hashMap = child.value as LinkedHashMap<Object?, Object?>;
            final newRecord = Record();

            newRecord.id = child.key!;

            if (hashMap[DbColumn.type.name] == RecordType.income.name) {
              newRecord.type = RecordType.income;
            } else {
              newRecord.type = RecordType.spend;
            }
            newRecord.title = hashMap[DbColumn.title.name] as String;
            newRecord.price = hashMap[DbColumn.price.name] as int;
            newRecord.category = Category();
            newRecord.date = hashMap[DbColumn.date.name] as String;

            _historyController.history["test"]?.add(newRecord);
          }
          print("Test");
        });
  }
}

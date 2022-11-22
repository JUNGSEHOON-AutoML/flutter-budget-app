import 'dart:collection';

import 'package:account_book/data/data_source/history_remote_data_source.dart';
import 'package:account_book/data/repository_impl/history_repository_impl.dart';
import 'package:account_book/di/my_service.dart';
import 'package:account_book/domain/model/record.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class GetHistoryUseCase extends GetxService {
  final _repository = Get.put(HistoryRepositoryImpl());

  void invoke() async {
    final stream = _repository.getHistory(uid: MyService.to.me.uid);
    stream.then((value) => value.listen((event) {
          for (final child in event.snapshot.children) {
            final hashMap = child.value as LinkedHashMap<Object?, Object?>;
            final newRecord =
                _rawDataToRecord(key: child.key!, hashMap: hashMap);

            final dateToken = newRecord.date.split("-");
            final dateKey = "${dateToken[0]}-${dateToken[1]}";

            if (!MyService.to.history.containsKey(dateKey)) {
              MyService.to.history[dateKey] = [];
            }
            MyService.to.history[dateKey]!.add(newRecord);
          }
        }));
  }

  Record _rawDataToRecord(
      {required String key, required LinkedHashMap hashMap}) {
    final newRecord = Record();

    newRecord.id = key;

    if (hashMap[DbColumn.type.name] == RecordType.income.name) {
      newRecord.type = RecordType.income;
    } else {
      newRecord.type = RecordType.spend;
    }
    newRecord.title = hashMap[DbColumn.title.name] as String;
    newRecord.price = hashMap[DbColumn.price.name] as int;

    final categoryId = hashMap[DbColumn.categoryId.name] as int;
    newRecord.category = MyService.to.getCategoryById(id: categoryId);

    final paymentId = hashMap[DbColumn.paymentId.name] as int;
    newRecord.payment = MyService.to.getPaymentById(id: paymentId);

    newRecord.date = hashMap[DbColumn.date.name] as String;

    return newRecord;
  }
}

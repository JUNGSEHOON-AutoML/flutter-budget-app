import 'package:account_book/di/my_service.dart';
import 'package:account_book/domain/use_case/properties_use_case/get_categories_use_case.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  // final items = List.generate(100, (index) => index).toList();

  @override
  Widget build(BuildContext context) {
    final test = Get.put(GetCategoriesUseCase());
    test.invoke();

    return Scaffold(
        body: monthDateListView(5));
  }
}

ListView monthDateListView(int length) {

  if (length == 0) {
    return ListView();
  }
  print(MyService.to.history);

  return ListView(
    scrollDirection: Axis.vertical,
    children: List.generate(length, (index) => index)
        .toList()
        .map((i) => Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
      children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "문화 여가",
                style:
                TextStyle(fontSize: 20),
              ),
              Text(
                "현대카드",
                style:
                TextStyle(fontSize: 20),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "스트리밍 서비스 정기 결제",
                style:
                TextStyle(fontSize: 20),
              ),
              Text(
                "-10,000원",
                style:
                TextStyle(fontSize: 20, color: Colors.red),
              )
            ],
          ),
      ],
    ),
        ))
        .toList(),
  );
}

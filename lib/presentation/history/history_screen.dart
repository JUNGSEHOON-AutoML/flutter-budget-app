import 'package:account_book/di/my_service.dart';
import 'package:account_book/domain/model/record.dart';
import 'package:account_book/domain/use_case/properties_use_case/get_categories_use_case.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  // final items = List.generate(100, (index) => index).toList();

  @override
  Widget build(BuildContext context) {
    final test = Get.put(GetCategoriesUseCase());
    test.invoke();

    // "2022-11"
    // print(MyService.to.history.keys);
    String nowYM = "2022" + "-" + "11";
    MyService.to.makeDummies();
    // print(MyService.to.history!.length);

    final items = List.generate(MyService.to.history[nowYM]!.length, (index) => index)
        .toList();

    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {},
            ),
            const Text('2022년 11월'),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {},
            ),
          ],
        ),
        body: ListView(
            scrollDirection: Axis.vertical,
            children: items.map((i) => listTileView(nowYM, i)).toList()
        )
    );
  }
}

  ListTile listTileView(String nowYM, int now) {
    if (MyService.to.history[nowYM]![now].type == RecordType.spend) {
      String cardName = MyService.to.history[nowYM]![now].payment!.name;
      String categoryName = MyService.to.history[nowYM]![now].category.name;
      String title = MyService.to.history[nowYM]![now].title;
      String price = MyService.to.history[nowYM]![now].price.toString();
      return ListTile(
        title: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${categoryName}",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "${cardName}",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${title}",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "-${price}원",
                    style: TextStyle(fontSize: 20, color: Colors.red),
                  )
                ],
              ),
            ],
          ),
        ),
        onTap: () {},
      );
    } else if (MyService.to.history[nowYM]![now].type == RecordType.income) {
      String categoryName = MyService.to.history[nowYM]![now].category.name;
      String title = MyService.to.history[nowYM]![now].title;
      String price = MyService.to.history[nowYM]![now].price.toString();
      return ListTile(
        title: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${categoryName}",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${title}",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "${price}원",
                    style: TextStyle(fontSize: 20, color: Colors.green),
                  )
                ],
              ),
            ],
          ),
        ),
        onTap: () {},
      );
    } else {
      return ListTile();
    }
  }

// record1.id = "1";
// record1.payment = Payment();
// record1.payment!.id = 1;
// record1.payment!.name = "카카오카드";
// record1.category = Category();
// record1.category.id = 1;
// record1.category.name = "경조사비";
// record1.category.color = AppColor.pink2;
// record1.type = RecordType.spend;
// record1.date = "2022-11-03";
// record1.price = 5000;
// record1.title = "정세훈 생일 선물";

// record2.id = "2";
// record2.category = Category();
// record2.category.id = 2;
// record2.category.name = "급여";
// record2.category.color = AppColor.olive5;
// record2.type = RecordType.income;
// record2.date = "2022-11-06";
// record2.price = 25000;
// record2.title = "아르바이트 급여";

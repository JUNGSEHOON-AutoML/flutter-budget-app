import 'package:account_book/di/my_service.dart';
import 'package:account_book/domain/model/record.dart';
import 'package:account_book/domain/use_case/properties_use_case/get_categories_use_case.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final test = Get.put(GetCategoriesUseCase());
    test.invoke();

    // "2022-11"
    String nowYM = "2022" + "-" + "11";
    int lastDate =
        int.parse(DateFormat('dd').format(DateTime(2022, 11 + 1, 0)));
    MyService.to.makeDummies();

    final items =
        List.generate(MyService.to.history[nowYM]!.length, (index) => index)
            .toList();

    for (int k = 1; k <= lastDate; k++) {
      if (k < 10) {
        List group = MyService.to.history[nowYM]!
            .where((data) => data.date == nowYM + '-0' + k.toString())
            .toList();
        if (group.length > 0) {
          print(k);
        }
      } else {
        List group = MyService.to.history[nowYM]!
            .where((data) => data.date == nowYM + '-' + k.toString())
            .toList();
        if (group.length > 0) {
          print(k);
        }
      }
    }

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
        body: Column(
          children: [
            const Text("11월 3일 월"),
            ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children:
                    items.map((i) => listTileViewAllType(nowYM, i)).toList()),
          ],
        ));
  }
}

Row ymdListAllType(String nowYMD, String nowYM, int now, int length) {
  return Row();
}

ListTile listTileViewAllType(String nowYM, int now) {
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

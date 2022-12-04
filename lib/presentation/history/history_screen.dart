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

    List groupList = [];
    for (int k = lastDate; k >= 1; k--) {
      if (k < 10) {
        List group = MyService.to.history[nowYM]!
            .where((data) => data.date == nowYM + '-0' + k.toString())
            .toList();
        if (group.length > 0) {
          groupList.add(group);
        }
      } else {
        List group = MyService.to.history[nowYM]!
            .where((data) => data.date == nowYM + '-' + k.toString())
            .toList();
        if (group.length > 0) {
          groupList.add(group);
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('2022년 11월'),
        elevation: 0.0,
        leading:  IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () {},
        ),
        actions: [IconButton(
          icon: const Icon(Icons.chevron_right),
          onPressed: () {},
        )]
      ),
      body: Column(
        children: [
          Column(
            children: [
              ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children:
                      groupList.map((e) => dateListTileAllType(e, e![0].date)).toList()),
            ],
          ),
        ],
      )
    );
  }
}

Column dateListTileAllType(List k, String date) {
  var d = DateTime.parse(date);
  return Column(
    children: [
      Text(DateFormat('MM월 dd일 EEEEE').format(d)),
      ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: k.map((e) => ymdList(e)).toList()),
    ],
  );

}

ListTile ymdList(Record e) {
  if (e.type == RecordType.spend) {
    String cardName = e.payment!.name;
    String categoryName = e.category.name;
    String title = e.title;
    String price = e.price.toString();
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
  } else if (e.type == RecordType.income) {
    String categoryName = e.category.name;
    String title = e.title;
    String price = e.price.toString();
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
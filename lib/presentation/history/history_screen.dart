import 'package:account_book/di/my_service.dart';
import 'package:account_book/domain/model/record.dart';
import 'package:account_book/domain/use_case/properties_use_case/get_categories_use_case.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../style.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final List<bool> _selected = <bool>[true, true];

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

    const List<Widget> toggle = <Widget>[
      Text('수입'),
      Text('지출'),
    ];

    // for (int n = 0; n < MyService.to.history[nowYM]!.length; n++) {
    //   if (MyService.to.history[nowYM]![n].type == RecordType.spend) {
    //     spend +=MyService.to.history[nowYM]![n].price;
    //   } else if (MyService.to.history[nowYM]![n].type == RecordType.income) {
    //     income += MyService.to.history[nowYM]![n].price;
    //   }
    // }

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
          leading: IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: () {},
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.chevron_right),
              onPressed: () {},
            )
          ]),
      body: Column(
        children: [
          Column(
            children: [
              SizedBox(height: 20),
              ToggleButtons(
                onPressed: (int index) {
                  setState(() {
                    _selected[index] = !_selected[index];
                  });
                },
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                selectedBorderColor: AppColor.purple1,
                selectedColor: Colors.white,
                fillColor: AppColor.purple1,
                color: AppColor.purple1,
                constraints: const BoxConstraints(
                  minHeight: 40.0,
                  minWidth: 190.0,
                ),
                isSelected: _selected,
                children: toggle,
              ),
              SizedBox(height: 30),
              ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: groupList
                      .map((e) => dateListTileAllType(e, e![0].date, _selected))
                      .toList()),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}

Column dateListTileAllType(List<Record> k, String date, List<bool> _selected) {
  var d = DateTime.parse(date);
  int dayIncome = 0;
  int daySpend = 0;

  for (int i = 0; i < k.length; i++) {
    if (k[i].type == RecordType.spend) {
      daySpend += k[i].price;
    } else if (k[i].type == RecordType.income) {
      dayIncome += k[i].price;
    }

    if (k[i].type == RecordType.spend && _selected[1] == false) {
      k.remove(k[i]);
    } else if (k[i].type == RecordType.income && _selected[0] == false) {
      k.remove(k[i]);
    }
  }
  print(dayIncome);
  print(daySpend);
  if (k.length == 0) {
    return Column();
  } else {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(DateFormat('MM월 dd일 EEEEE').format(d)),
            Row(
              children: [
                Text('수입 ' + dayIncome.toString()),
                SizedBox(width: 20),
                Text('지출 ' + daySpend.toString()),
              ],
            ),
          ],
        ),
        ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: k.map((e) => ymdList(e, _selected)).toList()),
        Divider(color: AppColor.purple1, thickness: 1.2),
      ],
    );
  }
}

ListTile ymdList(Record e, _selected) {
  if (e.type == RecordType.spend && _selected[1] == true) {
    String cardName = e.payment!.name;
    String categoryName = e.category.name;
    String title = e.title;
    String price = e.price.toString();
    return ListTile(
      title: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Divider(color: AppColor.brightpurple, thickness: 1.2),
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
  } else if (e.type == RecordType.income && _selected[0] == true) {
    String categoryName = e.category.name;
    String title = e.title;
    String price = e.price.toString();
    return ListTile(
      title: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Divider(color: AppColor.brightpurple, thickness: 1.2),
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
    print("!!");
    return ListTile();
  }
}

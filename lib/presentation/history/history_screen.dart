import 'package:account_book/application/my_service.dart';
import 'package:account_book/domain/model/record.dart';
import 'package:account_book/domain/use_case/history_use_case/delete_records_use_case.dart';
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
  final deleteRecordUseCase = Get.put(DeleteRecordUseCase());
  final List<Widget> returnToggle = [
    Row(
      children: [
        const Icon(Icons.check_box),
        SizedBox(width: 10),
        const Text('수입'),
      ],
    ),
    Row(
      children: [
        const Icon(Icons.check_box),
        SizedBox(width: 10),
        const Text('지출'),
      ],
    )
  ];

  @override
  Widget build(BuildContext context) {
    final test = Get.put(GetCategoriesUseCase());
    test.invoke();
    String nowYM = "${MyService.to.currentYear}-${MyService.to.currentMonth}";
    // "2022-11"
    if (MyService.to.currentMonth < 10) {
      nowYM = "${MyService.to.currentYear}-0${MyService.to.currentMonth}";
    }
    int lastDate =
        int.parse(DateFormat('dd').format(DateTime(2022, 11 + 1, 0)));
    MyService.to.makeDummies();

    List groupList = [];

    for (int k = lastDate; k >= 1; k--) {
      if (k < 10) {
        if (MyService.to.history[nowYM!] != null) {
          List group = MyService.to.history[nowYM!]!
              .where((data) => data.date == '$nowYM-0$k')
              .toList();
          if (group.isNotEmpty) {
            groupList.add(group);
          }
        }
      } else {
        if (MyService.to.history[nowYM!] != null) {
          List group = MyService.to.history[nowYM!]!
              .where((data) => data.date == '$nowYM-$k')
              .toList();
          if (group.isNotEmpty) {
            groupList.add(group);
          }
        }
      }
    }

    List toggle = [
      [
        Row(
          children: [
            const Icon(Icons.check_box_outline_blank),
            SizedBox(width: 10),
            const Text('수입'),
          ],
        ),
        Row(
          children: [
            const Icon(Icons.check_box),
            SizedBox(width: 10),
            const Text('수입'),
          ],
        ),
      ],
      [
        Row(
          children: [
            const Icon(Icons.check_box_outline_blank),
            SizedBox(width: 10),
            const Text('지출'),
          ],
        ),
        Row(
          children: [
            const Icon(Icons.check_box),
            SizedBox(width: 10),
            const Text('지출'),
          ],
        )
      ]
    ];

    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text(
                '${MyService.to.currentYear}년 ${MyService.to.currentMonth}월',
                style: const TextStyle(
                  fontSize: 21,
                  color: AppColor.purple1,
                  fontWeight: FontWeight.bold,
                )),
            elevation: 0.0,
            leading: IconButton(
              icon: const Icon(Icons.chevron_left),
              onPressed: () {
                setState(() {
                  if (MyService.to.currentMonth == 1) {
                    MyService.to.currentMonth = 12;
                    MyService.to.currentYear -= 1;
                  } else {
                    MyService.to.currentMonth -= 1;
                  }
                });
              },
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.chevron_right),
                onPressed: () {
                  setState(() {
                    if (MyService.to.currentMonth == 12) {
                      MyService.to.currentMonth = 1;
                      MyService.to.currentYear += 1;
                    } else {
                      MyService.to.currentMonth += 1;
                    }
                  });
                },
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
                    if (_selected[index]) {
                      setState(() {
                        returnToggle[index] = toggle[index][1];
                      });
                    } else {
                      setState(() {
                        returnToggle[index] = toggle[index][0];
                      });
                    }
                  },
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  selectedBorderColor: AppColor.purple1,
                  selectedColor: Colors.white,
                  fillColor: AppColor.purple1,
                  color: AppColor.purple1,
                  textStyle: const TextStyle(
                    fontSize: 20,
                  ),
                  constraints: const BoxConstraints(
                    minHeight: 40.0,
                    minWidth: 180.0,
                  ),
                  isSelected: _selected,
                  children: returnToggle,
                ),
                SizedBox(height: 20),
                ListView(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    children: groupList
                        .map((e) => dateListTileAllType(
                            e, e![0].date, _selected, deleteRecordUseCase))
                        .toList()),
              ],
            ),
          ],
        ),
        floatingActionButton: SizedBox(
          width: 70,
          height: 70,
          child: FittedBox(
            child: FloatingActionButton(
              onPressed: () {
                Get.toNamed("/addHistory");
              },
              child: Icon(Icons.add),
              backgroundColor: AppColor.yellow1,
            ),
          ),
        ));
  }
}

Column dateListTileAllType(List<Record> k, String date, List<bool> _selected,
    DeleteRecordUseCase deleteRecordUseCase) {
  var d = DateTime.parse(date);
  String ee = DateFormat('EEEEE').format(d).toString();
  if (ee == "Monday") {
    ee = "월";
  } else if (ee == "Tuesday") {
    ee = "화";
  } else if (ee == "Wednesday") {
    ee = "수";
  } else if (ee == "Thursday") {
    ee = "목";
  } else if (ee == "Friday") {
    ee = "금";
  } else if (ee == "Saturday") {
    ee = "토";
  } else if (ee == "Sunday") {
    ee = "일";
  }
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

  if (k.length == 0) {
    return Column();
  } else {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                DateFormat('MM월 dd일  ').format(d) + ee,
                style: TextStyle(
                  fontSize: 20,
                  color: AppColor.brightpurple,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Text(
                    '수입 ' + dayIncome.toString(),
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColor.brightpurple,
                    ),
                  ),
                  SizedBox(width: 20),
                  Text('지출 ' + daySpend.toString(),
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColor.brightpurple,
                      )),
                ],
              ),
            ],
          ),
        ),
        ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: k
                .map((e) => ymdList(e, _selected, (recordId) {
                      deleteRecordUseCase.invoke(recordId: recordId);
                      Get.snackbar(
                        '삭제 완료!',
                        '내역이 삭제되었습니다.',
                        backgroundColor: AppColor.red1,
                        colorText: Colors.white,
                      );
                    }))
                .toList()),
        Divider(color: AppColor.purple1, thickness: 1.2),
      ],
    );
  }
}

ListTile ymdList(Record e, _selected, onLongClickListener) {
  if (e.type == RecordType.spend && _selected[1] == true) {
    String cardName = e.payment!.name;
    String categoryName = e.category.name;
    String title = e.title;
    String price = e.price.toString();
    Color tagColor = e.category.color;
    return ListTile(
      title: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              // POINT
              color: AppColor.brightpurple,
              width: 1.5,
            ),
          ),
        ),
        child: Column(
          children: [
            // Divider(color: AppColor.brightpurple, thickness: 1.2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(
                    "${categoryName}",
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  decoration: BoxDecoration(
                    color: tagColor,
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                  width: 130.0,
                ),
                Text(
                  "${cardName}",
                  style: TextStyle(fontSize: 17, color: AppColor.purple0),
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${title}",
                  style: TextStyle(
                      fontSize: 20,
                      color: AppColor.purple0,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "-${price}원",
                  style: TextStyle(
                      fontSize: 20,
                      color: AppColor.red1,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ],
        ),
      ),
      onTap: () {
        print("text button is clicked");
      },
      onLongPress: () {
        print("text button is long clicked");
        onLongClickListener(e.id);
      },
    );
  } else if (e.type == RecordType.income && _selected[0] == true) {
    String categoryName = e.category.name;
    String title = e.title;
    String price = e.price.toString();
    Color tagColor = e.category.color;
    return ListTile(
      title: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              // POINT
              color: AppColor.brightpurple,
              width: 1.5,
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Divider(color: AppColor.brightpurple, thickness: 1.2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(
                    "${categoryName}",
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  decoration: BoxDecoration(
                    color: tagColor,
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                  width: 130.0,
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${title}",
                  style: TextStyle(
                      fontSize: 20,
                      color: AppColor.purple0,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "${price}원",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.green,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ],
        ),
      ),
      onTap: () {
        print("text button is clicked");
      },
      onLongPress: () {
        print("text button is long clicked");
        onLongClickListener(e.id);
      },
    );
  } else {
    return ListTile();
  }
}

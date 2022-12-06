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
  var scroll = ScrollController();

  final List<Widget> returnToggle = [
    Row(

      children: [
        const Icon(Icons.check_box, size: 15,),
        const SizedBox(width: 10),
        const Text('수입'),

      
      ],
    ),
    Row(
      children: const [
        Icon(Icons.check_box, size:15),
        SizedBox(width: 10),
        Text('지출'),
      ],
    )
  ];

  @override
  Widget build(BuildContext context) {
    String nowYM = "${MyService.to.currentYear}-${MyService.to.currentMonth}";
    // "2022-11"
    if (MyService.to.currentMonth < 10) {
      nowYM = "${MyService.to.currentYear}-0${MyService.to.currentMonth}";
    }
    int lastDate =
        int.parse(DateFormat('dd').format(DateTime(2022, 11 + 1, 0)));

    List toggle = [
      [
        Row(

          children: [
            const Icon(Icons.check_box_outline_blank, size: 15,),
            const SizedBox(width: 10),
            const Text('수입'),
          ],
        ),
        Row(
          children: [
            const Icon(Icons.check_box, size:15,),
            const SizedBox(width: 10),
            const Text('수입'),
          ],
        ),
      ],
      [
        Row(

          children: [
            const Icon(Icons.check_box_outline_blank, size:15),
            const SizedBox(width: 10),
            const Text('지출'),

          ],
        ),
        Row(
          children: const [
            Icon(Icons.check_box, size:15),
            SizedBox(width: 10),
            Text('지출'),
          ],
        )
      ]
    ];

    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            bottom: PreferredSize(
                preferredSize: const Size.fromHeight(4.0),
                child: Container(
                  color: AppColor.purple1,
                  height: 1.0,
                )),
            title: Text(
                '${MyService.to.currentYear}년 ${MyService.to.currentMonth}월',
                style: const TextStyle(
                  fontSize: 18,
                  color: AppColor.purple1,
                )),
            elevation: 0.0,
            leading: IconButton(
              icon: const Icon(
                Icons.chevron_left,
                color: AppColor.purple1,
              ),
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
                icon: const Icon(
                  Icons.chevron_right,
                  color: AppColor.purple1,
                ),
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
            const SizedBox(height: 20),
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
                  fontSize: 14,
                ),
                constraints: const BoxConstraints(
                  minHeight: 34.0,
                  minWidth: 180.0,
                ),
                isSelected: _selected,
                children: returnToggle,
              ),

            const SizedBox(height: 20),
            Obx(() {
                List groupList = [];

                for (int k = lastDate; k >= 1; k--) {
                  if (k < 10) {
                    if (MyService.to.history[nowYM] != null) {
                      List group = MyService.to.history[nowYM]!
                          .where((data) => data.date == '$nowYM-0$k')
                          .toList();
                      if (group.isNotEmpty) {
                        groupList.add(group);
                      }
                    }
                  } else {
                    if (MyService.to.history[nowYM] != null) {
                      List group = MyService.to.history[nowYM]!
                          .where((data) => data.date == '$nowYM-$k')
                          .toList();
                      if (group.isNotEmpty) {
                        groupList.add(group);
                      }
                    }
                  }
                }

                return Expanded(
                  child: ListView(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      children: groupList
                          .map((e) => dateListTileAllType(e, e![0].date,
                              _selected, deleteRecordUseCase, scroll))
                          .toList()),
                );
              },
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
              backgroundColor: AppColor.yellow1,
              child: const Icon(Icons.add),
            ),
          ),
        ));
  }
}

Column dateListTileAllType(List<Record> k, String date, List<bool> selected,
    DeleteRecordUseCase deleteRecordUseCase, ScrollController scroll) {
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

    if (k[i].type == RecordType.spend && selected[1] == false) {
      k.remove(k[i]);
    } else if (k[i].type == RecordType.income && selected[0] == false) {
      k.remove(k[i]);
    }
  }

  if (k.isEmpty) {
    return Column();
  } else {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25, right: 25,top:0,bottom:0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                DateFormat('MM월 dd일  ').format(d) + ee,
                style: const TextStyle(
                  fontSize: 18,
                  color: AppColor.brightpurple,
                ),
              ),


              Row(
                children: [
                  Text(
                    '수입 $dayIncome',
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColor.brightpurple,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Text('지출 $daySpend',
                      style: const TextStyle(
                        fontSize: 12,
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
            controller: scroll,
            children: k
                .map((e) => ymdList(e, selected, (recordId) {
                      deleteRecordUseCase.invoke(recordId: recordId);
                      Get.snackbar(
                        '삭제 완료!',
                        '내역이 삭제되었습니다.',
                        backgroundColor: AppColor.red1,
                        colorText: Colors.white,
                      );
                    }))
                .toList()),
        const Divider(color: AppColor.purple1, thickness: 1.2),
        Container(
          margin: EdgeInsets.fromLTRB(0, 0, 0, 12),
        ),
      ],
    );
  }
}

ListTile ymdList(Record e, selected, onLongClickListener) {
  if (e.type == RecordType.spend && selected[1] == true) {
    String cardName = e.payment!.name;
    String categoryName = e.category.name;
    String title = e.title;
    String price = e.price.toString();
    Color tagColor = e.category.color;
    return ListTile(
      title: Container(
        padding: const EdgeInsets.fromLTRB(0,16,0,0),
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
                  decoration: BoxDecoration(
                    color: tagColor,
                    borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                  ),
                  width: 100.0,
                  child: Text(
                    categoryName,
                    style: const TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                ),
                Text(
                  "${cardName}",
                  style: const TextStyle(fontSize: 12, color: AppColor.purple0),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 16,
                      color: AppColor.purple0,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "-$price원",
                  style: const TextStyle(
                      fontSize: 16,
                      color: AppColor.red1,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ],
        ),
      ),
      onLongPress: () {
        onLongClickListener(e.id);
      },
    );
  } else if (e.type == RecordType.income && selected[0] == true) {
    String categoryName = e.category.name;
    String title = e.title;
    String price = e.price.toString();
    Color tagColor = e.category.color;
    return ListTile(
      title: Container(
        padding: const EdgeInsets.fromLTRB(0,16,0,0),
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
                  decoration: BoxDecoration(
                    color: tagColor,
                    borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                  ),
                  width: 100.0,
                  child: Text(
                    categoryName,
                    style: const TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  
                  padding: EdgeInsets.fromLTRB(8, 4, 8, 4),

                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 16,
                      color: AppColor.purple0,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "$price원",
                  style: const TextStyle(
                      fontSize: 16,
                      color: Colors.green,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ],
        ),
      ),
      onLongPress: () {
        onLongClickListener(e.id);
      },
    );
  } else {
    return const ListTile();
  }
}

import 'package:account_book/domain/model/record.dart';
import 'package:account_book/style.dart';
import 'package:date_utils/date_utils.dart' as dt;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../application/my_service.dart';
import '../../../domain/use_case/properties_use_case/get_categories_use_case.dart';
import '../widget/day_widget.dart';
import 'package:intl/intl.dart';

class CalendarMain extends StatefulWidget {
  const CalendarMain({Key? key}) : super(key: key);

  @override
  _CalendarMainState createState() => _CalendarMainState();
}

class _CalendarMainState extends State<CalendarMain> {
  //해당 달에 포함되는 일 List
  List<String?> date_list = [];
  Future? myfuture;
  DateTime? now;
  var daysinmonth;

  //삽입 데이터 list
  List data_list = List.generate(42, (_) => []);
  var start_count;
  var monthIncome;
  var monthSpend;
  var monthSum;

  @override
  void initState() {
    date_list = [];
    data_list = List.generate(42, (_) => []);
    monthIncome = 0;
    monthSum = 0;
    monthSpend = 0;
    now = DateTime(MyService.to.currentYear, MyService.to.currentMonth);
    daysinmonth = dt.DateUtils.daysInMonth(now!);
    get_date_list();
    super.initState();
  }

  filter_string_date(String date) {
    if (date.substring(0, 1) == "0") {
      return date.substring(1, 2);
    } else {
      return date;
    }
  }

  get_date_list() {
    int flag = 1;
    int count = 0;
    for (var i = 0; i < daysinmonth.length; i++) {
      var this_date;
      this_date =
          filter_string_date(daysinmonth[i].toString().substring(8, 10));
      date_list.add(this_date);
      if (flag == 1 && this_date != "1") {
        count += 1;
      } else if (flag == 1 && this_date == "1") {
        flag = 0;
      }
    }
    start_count = count;
  }

  //저번달로 넘기는 함수
  set_datesub_list() {
    date_list = [];
    data_list = List.generate(42, (_) => []);
    int count = 0;
    monthIncome = 0;
    monthSum = 0;
    monthSpend = 0;
    setState(() {
      if (MyService.to.currentMonth - 1 == 0) {
        MyService.to.currentYear -= 1;
        MyService.to.currentMonth = 12;
      } else {
        MyService.to.currentMonth -= 1;
      }
      DateTime date_time =
          DateTime(MyService.to.currentYear, MyService.to.currentMonth);
      daysinmonth = dt.DateUtils.daysInMonth(date_time);
      date_list = [];
      int flag = 1;

      for (var i = 0; i < daysinmonth.length; i++) {
        var this_date;
        this_date =
            filter_string_date(daysinmonth[i].toString().substring(8, 10));
        date_list.add(this_date);
        if (flag == 1 && this_date != "1") {
          count += 1;
        } else if (flag == 1 && this_date == "1") {
          flag = 0;
        }
      }
      start_count = count;
    });
    // local_data_filter_year();
  }

  //다음달로 넘기는 함수
  set_dateplus_list() {
    date_list = [];
    data_list = List.generate(42, (_) => []);
    int count = 0;
    monthIncome = 0;
    monthSum = 0;
    monthSpend = 0;
    setState(() {
      if (MyService.to.currentMonth + 1 == 13) {
        MyService.to.currentYear += 1;
        MyService.to.currentMonth = 1;
      } else {
        MyService.to.currentMonth += 1;
      }

      DateTime date_time =
          DateTime(MyService.to.currentYear, MyService.to.currentMonth);
      daysinmonth = dt.DateUtils.daysInMonth(date_time);
      date_list = [];
      int flag = 1;
      for (var i = 0; i < daysinmonth.length; i++) {
        var this_date;
        this_date =
            filter_string_date(daysinmonth[i].toString().substring(8, 10));
        date_list.add(this_date);
        if (flag == 1 && this_date != "1") {
          count += 1;
        } else if (flag == 1 && this_date == "1") {
          flag = 0;
        }
      }
      start_count = count;
    });

    // local_data_filter_year();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String nowYM = "${MyService.to.currentYear}-${MyService.to.currentMonth}";
    // "2022-11"
    if (MyService.to.currentMonth < 10) {
      nowYM = "${MyService.to.currentYear}-0${MyService.to.currentMonth}";
    }
    int lastDate =
        int.parse(DateFormat('dd').format(DateTime(2022, 11 + 1, 0)));

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

    for (int g = 0; g < groupList.length; g++) {
      var d = DateTime.parse(groupList[g][0].date);
      int day = int.parse(DateFormat('dd').format(d));
      int index = day + int.parse(start_count.toString()) - 1;
      if (data_list[index].length == 0) {
        data_list[index] = [0, 0, 0];
      }
      if (groupList[g][0].type == RecordType.income) {
        data_list[index][0] += groupList[g][0].price;
        data_list[index][1] += groupList[g][0].price;
        monthIncome += groupList[g][0].price;
        monthSum += groupList[g][0].price;
      } else {
        data_list[index][0] -= groupList[g][0].price;
        data_list[index][2] -= groupList[g][0].price;
        monthSpend += groupList[g][0].price;
        monthSum -= groupList[g][0].price;
      }

      // RecordType.spend
    }

    return Scaffold(
        appBar:
        AppBar(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            bottom: PreferredSize(
                child: Container(
                  color: AppColor.purple1,
                  height: 1.0,
                ),
                preferredSize: Size.fromHeight(4.0)),
            title: Text(
                '${MyService.to.currentYear}년 ${MyService.to.currentMonth}월',
                style: const TextStyle(
                  fontSize: 18,
                  color: AppColor.purple1,
                )),
            elevation: 0.0,
            leading: IconButton(
              icon: const Icon(Icons.chevron_left, color: AppColor.purple1,),
              onPressed: () {
                set_datesub_list();
              },
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.chevron_right, color: AppColor.purple1,),
                onPressed: () {
                  set_dateplus_list();
                },
              )
            ]),
        body: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(height: 20,),
            Container(
              width: size.width * 1,
              height: size.height * 0.8,
              child: Column(
                children: [
                  //요일 ROW
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "일",
                        style: TextStyle(
                            color: Colors.red,
                            fontFamily: "gilogfont",
                            fontSize: 20),
                      ),
                      Text(
                        "월",
                        style: TextStyle(fontFamily: "gilogfont", fontSize: 20),
                      ),
                      Text(
                        "화",
                        style: TextStyle(fontFamily: "gilogfont", fontSize: 20),
                      ),
                      Text(
                        "수",
                        style: TextStyle(fontFamily: "gilogfont", fontSize: 20),
                      ),
                      Text(
                        "목",
                        style: TextStyle(fontFamily: "gilogfont", fontSize: 20),
                      ),
                      Text(
                        "금",
                        style: TextStyle(fontFamily: "gilogfont", fontSize: 20),
                      ),
                      InkWell(
                        onTap: () {
                        },
                        child: Text(
                          "토",
                          style: TextStyle(
                              fontFamily: "gilogfont",
                              fontSize: 20,
                              color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Column(
                    children: [
                      date_list.length == 42
                          ? date_list[6] == "31"
                              ? Container()
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Day_Widget(
                                        size, date_list[0], data_list[0]),
                                    Day_Widget(
                                        size, date_list[1], data_list[1]),
                                    Day_Widget(
                                        size, date_list[2], data_list[2]),
                                    Day_Widget(
                                        size, date_list[3], data_list[3]),
                                    Day_Widget(
                                        size, date_list[4], data_list[4]),
                                    Day_Widget(
                                        size, date_list[5], data_list[5]),
                                    Day_Widget(
                                        size, date_list[6], data_list[6]),
                                  ],
                                )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Day_Widget(size, date_list[0], data_list[0]),
                                Day_Widget(size, date_list[1], data_list[1]),
                                Day_Widget(size, date_list[2], data_list[2]),
                                Day_Widget(size, date_list[3], data_list[3]),
                                Day_Widget(size, date_list[4], data_list[4]),
                                Day_Widget(size, date_list[5], data_list[5]),
                                Day_Widget(size, date_list[6], data_list[6]),
                              ],
                            ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Day_Widget(size, date_list[7], data_list[7]),
                          Day_Widget(size, date_list[8], data_list[8]),
                          Day_Widget(size, date_list[9], data_list[9]),
                          Day_Widget(size, date_list[10], data_list[10]),
                          Day_Widget(size, date_list[11], data_list[11]),
                          Day_Widget(size, date_list[12], data_list[12]),
                          Day_Widget(size, date_list[13], data_list[13]),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Day_Widget(size, date_list[14], data_list[14]),
                          Day_Widget(size, date_list[15], data_list[15]),
                          Day_Widget(size, date_list[16], data_list[16]),
                          Day_Widget(size, date_list[17], data_list[17]),
                          Day_Widget(size, date_list[18], data_list[18]),
                          Day_Widget(size, date_list[19], data_list[19]),
                          Day_Widget(size, date_list[20], data_list[20]),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Day_Widget(size, date_list[21], data_list[21]),
                          Day_Widget(size, date_list[22], data_list[22]),
                          Day_Widget(size, date_list[23], data_list[23]),
                          Day_Widget(size, date_list[24], data_list[24]),
                          Day_Widget(size, date_list[25], data_list[25]),
                          Day_Widget(size, date_list[26], data_list[26]),
                          Day_Widget(size, date_list[27], data_list[27]),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Day_Widget(size, date_list[28], data_list[28]),
                          Day_Widget(size, date_list[29], data_list[29]),
                          Day_Widget(size, date_list[30], data_list[30]),
                          Day_Widget(size, date_list[31], data_list[31]),
                          Day_Widget(size, date_list[32], data_list[32]),
                          Day_Widget(size, date_list[33], data_list[33]),
                          Day_Widget(size, date_list[34], data_list[34]),
                        ],
                      ),
                      date_list.length == 42
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Day_Widget(size, date_list[35], data_list[35]),
                                Day_Widget(size, date_list[36], data_list[36]),
                                Day_Widget(size, date_list[37], data_list[37]),
                                Day_Widget(size, date_list[38], data_list[38]),
                                Day_Widget(size, date_list[39], data_list[39]),
                                Day_Widget(size, date_list[40], data_list[40]),
                                Day_Widget(size, date_list[41], data_list[41]),
                              ],
                            )
                          : Container(
                              height: size.height * 0.1,
                            ),
                    ],
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "수입:${monthIncome}",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: AppColor.purple1),
                          ),
                          Text(
                            "지출:${monthSpend}",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: AppColor.red1),
                          ),
                          Text(
                            "총합:${monthSum}",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: AppColor.blue4),
                          ),
                        ],
                      ))
                ],
              ),
            ),
          ],
        )));
  }
}

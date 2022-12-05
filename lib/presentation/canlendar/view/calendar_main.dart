import 'package:account_book/domain/model/record.dart';
import 'package:date_utils/date_utils.dart' as dt;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../di/my_service.dart';
import '../../../domain/use_case/properties_use_case/get_categories_use_case.dart';
import '../widget/day_widget.dart';
import 'package:intl/intl.dart';

class Calendar_Main extends StatefulWidget {
  const Calendar_Main({Key? key}) : super(key: key);

  @override
  _Calendar_MainState createState() => _Calendar_MainState();
}

class _Calendar_MainState extends State<Calendar_Main> {
  //해당 달에 포함되는 일 List
  List<String?> date_list = [];
  Future? myfuture;
  DateTime? now;
  var daysinmonth;

  //삽입 데이터 list
  List data_list = [];
  var start_count;

  //현재 화면 달,년도
  var this_month;
  var this_year;

  @override
  void initState() {
    date_list = [];
    data_list = [];
    get_datetime();
    get_date_list();
    super.initState();
  }

  get_datetime() {
    now = DateTime.now();
    daysinmonth = dt.DateUtils.daysInMonth(now!);
    this_month = now!.month;
    this_year = now!.year;
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
      print(
          this_year.toString() + this_month.toString() + this_date.toString());
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
    int count = 0;
    setState(() {
      if (this_month - 1 == 0) {
        this_year = this_year - 1;
        this_month = 12;
      } else {
        this_month -= 1;
      }
      DateTime date_time = DateTime(this_year, this_month);
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
    int count = 0;
    setState(() {
      if (this_month + 1 == 13) {
        this_year = this_year + 1;
        this_month = 1;
      } else {
        this_month += 1;
      }

      DateTime date_time = DateTime(this_year, this_month);
      daysinmonth = dt.DateUtils.daysInMonth(date_time);
      date_list = [];
      int flag = 1;
      for (var i = 0; i < daysinmonth.length; i++) {
        var this_date;
        this_date =
            filter_string_date(daysinmonth[i].toString().substring(8, 10));
        date_list.add(this_date);
        //print(this_year.toString() + this_month.toString() + this_date);
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
    print(start_count);

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
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.grey.shade400,
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                    onTap: () {
                      set_datesub_list();
                      setState(() {
                        if (MyService.to.currentMonth == 1) {
                          MyService.to.currentMonth = 12;
                          MyService.to.currentYear -= 1;
                        } else {
                          MyService.to.currentMonth -= 1;
                        }
                      });
                    },
                    child: Icon(
                      Icons.arrow_left,
                      size: 50,
                    )),
                InkWell(
                  onTap: () {},
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "$this_year 년 $this_month 월",
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.bold),
                      )
                    ],
                  )),
                ),
                InkWell(
                    onTap: () {
                      set_dateplus_list();
                      setState(() {
                        if (MyService.to.currentMonth == 12) {
                          MyService.to.currentMonth = 1;
                          MyService.to.currentYear += 1;
                        } else {
                          MyService.to.currentMonth += 1;
                        }
                      });
                    },
                    child: Icon(
                      Icons.arrow_right,
                      size: 50,
                    )),
              ],
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
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
                          print(date_list[6]);
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
                                    Day_Widget(size, date_list[0], null),
                                    Day_Widget(size, date_list[1], null),
                                    Day_Widget(size, date_list[2], null),
                                    Day_Widget(size, date_list[3], null),
                                    Day_Widget(size, date_list[4], null),
                                    Day_Widget(size, date_list[5], null),
                                    Day_Widget(size, date_list[6], null),
                                  ],
                                )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Day_Widget(size, date_list[0], null),
                                Day_Widget(size, date_list[1], null),
                                Day_Widget(size, date_list[2], null),
                                Day_Widget(size, date_list[3], null),
                                Day_Widget(size, date_list[4], null),
                                Day_Widget(size, date_list[5], null),
                                Day_Widget(size, date_list[6], null),
                              ],
                            ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Day_Widget(size, date_list[7], null),
                          Day_Widget(size, date_list[8], null),
                          Day_Widget(size, date_list[9], null),
                          Day_Widget(size, date_list[10], null),
                          Day_Widget(size, date_list[11], null),
                          Day_Widget(size, date_list[12], null),
                          Day_Widget(size, date_list[13], null),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Day_Widget(size, date_list[14], null),
                          Day_Widget(size, date_list[15], null),
                          Day_Widget(size, date_list[16], null),
                          Day_Widget(size, date_list[17], null),
                          Day_Widget(size, date_list[18], null),
                          Day_Widget(size, date_list[19], null),
                          Day_Widget(size, date_list[20], null),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Day_Widget(size, date_list[21], null),
                          Day_Widget(size, date_list[22], null),
                          Day_Widget(size, date_list[23], null),
                          Day_Widget(size, date_list[24], null),
                          Day_Widget(size, date_list[25], null),
                          Day_Widget(size, date_list[26], null),
                          Day_Widget(size, date_list[27], null),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Day_Widget(size, date_list[28], null),
                          Day_Widget(size, date_list[29], null),
                          Day_Widget(size, date_list[30], null),
                          Day_Widget(size, date_list[31], null),
                          Day_Widget(size, date_list[32], null),
                          Day_Widget(size, date_list[33], null),
                          Day_Widget(size, date_list[34], null),
                        ],
                      ),
                      date_list.length == 42
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Day_Widget(size, date_list[35], null),
                                Day_Widget(size, date_list[36], null),
                                Day_Widget(size, date_list[37], null),
                                Day_Widget(size, date_list[38], null),
                                Day_Widget(size, date_list[39], null),
                                Day_Widget(size, date_list[40], null),
                                Day_Widget(size, date_list[41], null),
                              ],
                            )
                          : Container(
                              height: size.height * 0.1,
                            ),
                    ],
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 0),
                      child: Text(
                        "수입: 지출: 총합:",
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            ),
          ],
        )));
  }
}

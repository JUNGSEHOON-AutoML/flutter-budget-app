import 'dart:math' as math;

import 'package:account_book/application/my_service.dart';
import 'package:account_book/domain/model/record.dart';
import 'package:account_book/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

import 'graphdetail_view.dart';

class GraphScreen extends StatefulWidget {
  const GraphScreen({Key? key}) : super(key: key);

  @override
  _GraphScreenState createState() => _GraphScreenState();
}

class _GraphScreenState extends State<GraphScreen> {
  DateTime date = DateTime.now();
  DateTime? picked_date;

  @override
  Widget build(BuildContext context) {
    final data = MyService
        .to.history["${MyService.to.currentYear}-${MyService.to.currentMonth}"];
    var totalPrice = 0;
    final dataMap = <String, double>{};

    final colorMap = <String, Color>{};

    if (data == null) {
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
        body: Center(
          child: Text("Empty graph"),
        ),
      );
    }

    for (final record in data!) {
      if (record.type == RecordType.spend) {
        final category = record.category;
        if (!dataMap.containsKey(category.name)) {
          dataMap[category.name] = 0;
          colorMap[category.name] =
              Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                  .withOpacity(1.0);
        }
        dataMap[category.name] = dataMap[category.name]! + record.price;
        totalPrice += record.price;
      }
    }

    if (dataMap.isEmpty) {
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
        body: Center(
          child: Text("Empty graph"),
        ),
      );
    } else {
      Size size = MediaQuery.of(context).size;
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30.0, bottom: 60),
                child: Text(
                  "총 지출 금액: $totalPrice원",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 19),
                ),
              ),
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PieChart(
                      colorList: colorMap.values.toList(),
                      dataMap: dataMap,
                      animationDuration: const Duration(milliseconds: 200),
                      chartLegendSpacing: 90,
                      chartRadius: MediaQuery.of(context).size.width / 3.2,
                      ringStrokeWidth: 20,
                      chartType: ChartType.ring,
                      legendOptions: const LegendOptions(
                        showLegendsInRow: false,
                        legendPosition: LegendPosition.bottom,
                        legendTextStyle: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                      chartValuesOptions: const ChartValuesOptions(
                        showChartValueBackground: false,
                        showChartValues: true,
                        showChartValuesInPercentage: false,
                        showChartValuesOutside: false,
                        decimalPlaces: 1,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }
  }
}

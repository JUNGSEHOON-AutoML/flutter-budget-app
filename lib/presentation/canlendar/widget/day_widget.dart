import 'package:account_book/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//data는 수입,지출,총합 내용을 포함한 객체로 넘겨준뒤 해당 객체에 접근해 얻도록 구현하시면 됩니다
Widget Day_Widget(Size size, day, data){
  if (data.length == 0) {
    return Container(
        width: size.width * 0.1,
        height: size.height * 0.1,
        child: Column(children: [
          Text("${day}"),
          data==null?Container():
          Column(
          )

        ]));
  } else {
    return Container(
        width: size.width * 0.1,
        height: size.height * 0.1,
        child: Column(children: [
          Text("${day}"),
          data==null?Container():
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
              ),
              Text(
                "${data[1]}",
                style: TextStyle(fontSize: 8, color: AppColor.purple1),
              ),
              Text(
                "${data[2]}",
                style: TextStyle(fontSize: 8, color: AppColor.red1),
              ),
              Text(
                "${data[0]}",
                style: TextStyle(fontSize: 8, color: AppColor.blue4),
              ),
            ],
          )

        ]));
  }
}
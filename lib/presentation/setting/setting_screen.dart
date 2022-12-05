import 'package:account_book/di/my_service.dart';
import 'package:account_book/domain/model/category.dart';
import 'package:account_book/domain/model/payment.dart';
import 'package:account_book/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../domain/model/record.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final _midController = TextEditingController();

  @override
  void dispose() {
    _midController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('설정', style: TextStyle(color: Color(0xff524D90))),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: ListView(
              children: [
                TextField(
                  decoration: const InputDecoration(
                    labelText: '결제수단',
                  ),
                  controller: _midController,
                  enabled: false,
                  style: TextStyle(fontSize: 18),
                ),
                ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: MyService.to.payments.length-1,
                    itemBuilder: (BuildContext context, int i) {
                      return ListTile(
                        title: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.all(0),
                          ),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(MyService.to.payments[i+1]?.name ?? "",
                                  style: TextStyle(fontSize: 16))),
                        ),
                      );
                    }),
                CupertinoButton(
                  onPressed: () {
                    Get.toNamed("/addAccount");
                  },
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '결제수단 추가하기                                              +',
                        style: TextStyle(color: AppColor.purple1),
                      )),
                ),
                Container(height: 1.0, color: AppColor.purple1),
                TextFormField(
                    decoration: const InputDecoration(
                      labelText: '지출 카테고리',
                      iconColor: Color(0xffA79FCB),
                    ),
                    controller: _midController,
                    enabled: false,
                    style: TextStyle(fontSize: 18)),
                CupertinoButton(
                  onPressed: () {
                    Get.toNamed("/addExpense");
                  },
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '지출 카테고리 추가하기                                     +',
                        style: TextStyle(color: AppColor.purple1),
                      )),
                ),
                Container(height: 1.0, color: AppColor.purple1),
                TextFormField(
                    decoration: const InputDecoration(
                      labelText: '수입 카테고리',
                    ),
                    controller: _midController,
                    enabled: false,
                    style: TextStyle(fontSize: 18)),
                CupertinoButton(
                  onPressed: () {
                    Get.toNamed("/addIncome");
                  },
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '수입 카테고리 추가하기                                     +',
                        style: TextStyle(color: AppColor.purple1),
                      )),
                ),
                Container(height: 1.0, color: AppColor.purple1),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

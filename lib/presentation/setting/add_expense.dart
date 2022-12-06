import 'package:account_book/domain/model/record.dart';
import 'package:account_book/domain/use_case/properties_use_case/add_category_use_case.dart';
import 'package:account_book/presentation/setting/setting_screen.dart';
import 'package:account_book/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:account_book/domain/model/category.dart';

import '../main.dart';

class AddExpense extends StatelessWidget {
  const AddExpense({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyHomePage();
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _expenseController = TextEditingController();
  final addExpenseUseCase = Get.put(AddCategoryUseCase());
  final _expenseKey = GlobalKey<FormState>();
  Color _color = Colors.white;
  bool isClicked1 = false;
  bool isClicked2 = false;
  bool isClicked3 = false;
  bool isClicked4 = false;
  bool isClicked5 = false;
  bool isClicked6 = false;
  bool isClicked7 = false;
  bool isClicked8 = false;
  bool isClicked9 = false;
  bool isClicked10 = false;
  bool isClicked11 = false;
  bool isClicked12 = false;
  bool isClicked13 = false;
  bool isClicked14 = false;
  bool isClicked15 = false;
  bool isClicked16 = false;
  bool isClicked17 = false;
  bool isClicked18 = false;
  bool isClicked19 = false;
  bool isClicked20 = false;

  @override
  void dispose() {
    _expenseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar:AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          bottom: PreferredSize(
              child: Container(
                color: AppColor.purple1,
                height: 1.0,
              ),
              preferredSize: Size.fromHeight(4.0)),
          title: Text('지출 카테고리 추가',
              style: const TextStyle(
                fontSize: 18,
                color: AppColor.purple1,
              )),
          elevation: 0.0,
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: AppColor.purple1,),
            onPressed: (){
              Get.back();
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Form(
              key: _expenseKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: '이름',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '카테고리를 입력하세요';
                      }
                      return null;
                    },
                    controller: _expenseController,
                    // keyboardType: TextInputType.name,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                    child: Text('색상'),
                  ),
                  Container(
                      child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Center(
                          child: SizedBox(
                            height: (isClicked1) ? 30 : 20,
                            width: (isClicked1) ? 30 : 20,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _color = AppColor.blue1;
                                  isClicked1 = true;
                                  isClicked2 = false;
                                  isClicked3 = false;
                                  isClicked4 = false;
                                  isClicked5 = false;
                                  isClicked6 = false;
                                  isClicked7 = false;
                                  isClicked8 = false;
                                  isClicked9 = false;
                                  isClicked10 = false;
                                  isClicked11 = false;
                                  isClicked12 = false;
                                  isClicked13 = false;
                                  isClicked14 = false;
                                  isClicked15 = false;
                                  isClicked16 = false;
                                  isClicked17 = false;
                                  isClicked18 = false;
                                  isClicked19 = false;
                                  isClicked20 = false;
                                });
                              },
                              child: null,
                              style: ElevatedButton.styleFrom(
                                primary: AppColor.blue1,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(1)),
                      Expanded(
                        child: Center(
                          child: SizedBox(
                            height: (isClicked2) ? 30 : 20,
                            width: (isClicked2) ? 30 : 20,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _color = AppColor.blue2;
                                  isClicked2 = true;
                                  isClicked1 = false;
                                  isClicked3 = false;
                                  isClicked4 = false;
                                  isClicked5 = false;
                                  isClicked6 = false;
                                  isClicked7 = false;
                                  isClicked8 = false;
                                  isClicked9 = false;
                                  isClicked10 = false;
                                  isClicked11 = false;
                                  isClicked12 = false;
                                  isClicked13 = false;
                                  isClicked14 = false;
                                  isClicked15 = false;
                                  isClicked16 = false;
                                  isClicked17 = false;
                                  isClicked18 = false;
                                  isClicked19 = false;
                                  isClicked20 = false;
                                });
                              },
                              child: null,
                              style: ElevatedButton.styleFrom(
                                primary: AppColor.blue2,
                                fixedSize: Size(1, 1),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: SizedBox(
                            height: (isClicked3) ? 30 : 20,
                            width: (isClicked3) ? 30 : 20,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _color = AppColor.blue3;
                                  isClicked3 = true;
                                  isClicked1 = false;
                                  isClicked2 = false;
                                  isClicked4 = false;
                                  isClicked5 = false;
                                  isClicked6 = false;
                                  isClicked7 = false;
                                  isClicked8 = false;
                                  isClicked9 = false;
                                  isClicked10 = false;
                                  isClicked11 = false;
                                  isClicked12 = false;
                                  isClicked13 = false;
                                  isClicked14 = false;
                                  isClicked15 = false;
                                  isClicked16 = false;
                                  isClicked17 = false;
                                  isClicked18 = false;
                                  isClicked19 = false;
                                  isClicked20 = false;
                                });
                              },
                              child: null,
                              style: ElevatedButton.styleFrom(
                                primary: AppColor.blue3,
                                fixedSize: Size(1, 1),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: SizedBox(
                            height: (isClicked4) ? 30 : 20,
                            width: (isClicked4) ? 30 : 20,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _color = AppColor.blue4;
                                  isClicked4 = true;
                                  isClicked2 = false;
                                  isClicked3 = false;
                                  isClicked1 = false;
                                  isClicked5 = false;
                                  isClicked6 = false;
                                  isClicked7 = false;
                                  isClicked8 = false;
                                  isClicked9 = false;
                                  isClicked10 = false;
                                  isClicked11 = false;
                                  isClicked12 = false;
                                  isClicked13 = false;
                                  isClicked14 = false;
                                  isClicked15 = false;
                                  isClicked16 = false;
                                  isClicked17 = false;
                                  isClicked18 = false;
                                  isClicked19 = false;
                                  isClicked20 = false;
                                });
                              },
                              child: null,
                              style: ElevatedButton.styleFrom(
                                primary: AppColor.blue4,
                                fixedSize: Size(1, 1),
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Padding(padding: EdgeInsets.all(1)),
                      Expanded(
                        child: Center(
                          child: SizedBox(
                            height: (isClicked5) ? 30 : 20,
                            width: (isClicked5) ? 30 : 20,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _color = AppColor.blue5;
                                  isClicked5 = true;
                                  isClicked2 = false;
                                  isClicked3 = false;
                                  isClicked4 = false;
                                  isClicked1 = false;
                                  isClicked6 = false;
                                  isClicked7 = false;
                                  isClicked8 = false;
                                  isClicked9 = false;
                                  isClicked10 = false;
                                  isClicked11 = false;
                                  isClicked12 = false;
                                  isClicked13 = false;
                                  isClicked14 = false;
                                  isClicked15 = false;
                                  isClicked16 = false;
                                  isClicked17 = false;
                                  isClicked18 = false;
                                  isClicked19 = false;
                                  isClicked20 = false;
                                });
                              },
                              child: null,
                              style: ElevatedButton.styleFrom(
                                primary: AppColor.blue5,
                                fixedSize: Size(1, 1),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: SizedBox(
                            height: (isClicked6) ? 30 : 20,
                            width: (isClicked6) ? 30 : 20,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _color = AppColor.green1;
                                  isClicked6 = true;
                                  isClicked2 = false;
                                  isClicked3 = false;
                                  isClicked4 = false;
                                  isClicked5 = false;
                                  isClicked1 = false;
                                  isClicked7 = false;
                                  isClicked8 = false;
                                  isClicked9 = false;
                                  isClicked10 = false;
                                  isClicked11 = false;
                                  isClicked12 = false;
                                  isClicked13 = false;
                                  isClicked14 = false;
                                  isClicked15 = false;
                                  isClicked16 = false;
                                  isClicked17 = false;
                                  isClicked18 = false;
                                  isClicked19 = false;
                                  isClicked20 = false;
                                });
                              },
                              child: null,
                              style: ElevatedButton.styleFrom(
                                primary: AppColor.green1,
                                fixedSize: Size(1, 1),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(1)),
                      Expanded(
                        child: Center(
                          child: SizedBox(
                            height: (isClicked7) ? 30 : 20,
                            width: (isClicked7) ? 30 : 20,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _color = AppColor.green2;
                                  isClicked7 = true;
                                  isClicked2 = false;
                                  isClicked3 = false;
                                  isClicked4 = false;
                                  isClicked5 = false;
                                  isClicked6 = false;
                                  isClicked1 = false;
                                  isClicked8 = false;
                                  isClicked9 = false;
                                  isClicked10 = false;
                                  isClicked11 = false;
                                  isClicked12 = false;
                                  isClicked13 = false;
                                  isClicked14 = false;
                                  isClicked15 = false;
                                  isClicked16 = false;
                                  isClicked17 = false;
                                  isClicked18 = false;
                                  isClicked19 = false;
                                  isClicked20 = false;
                                });
                              },
                              child: null,
                              style: ElevatedButton.styleFrom(
                                primary: AppColor.green2,
                                fixedSize: Size(1, 1),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(1)),
                      Expanded(
                        child: Center(
                          child: SizedBox(
                            height: (isClicked8) ? 30 : 20,
                            width: (isClicked8) ? 30 : 20,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _color = AppColor.green3;
                                  isClicked8 = true;
                                  isClicked2 = false;
                                  isClicked3 = false;
                                  isClicked4 = false;
                                  isClicked5 = false;
                                  isClicked6 = false;
                                  isClicked7 = false;
                                  isClicked1 = false;
                                  isClicked9 = false;
                                  isClicked10 = false;
                                  isClicked11 = false;
                                  isClicked12 = false;
                                  isClicked13 = false;
                                  isClicked14 = false;
                                  isClicked15 = false;
                                  isClicked16 = false;
                                  isClicked17 = false;
                                  isClicked18 = false;
                                  isClicked19 = false;
                                  isClicked20 = false;
                                });
                              },
                              child: null,
                              style: ElevatedButton.styleFrom(
                                primary: AppColor.green3,
                                fixedSize: Size(1, 1),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(1)),
                      Expanded(
                        child: Center(
                          child: SizedBox(
                            height: (isClicked9) ? 30 : 20,
                            width: (isClicked9) ? 30 : 20,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _color = AppColor.green4;
                                  isClicked9 = true;
                                  isClicked2 = false;
                                  isClicked3 = false;
                                  isClicked4 = false;
                                  isClicked5 = false;
                                  isClicked6 = false;
                                  isClicked7 = false;
                                  isClicked8 = false;
                                  isClicked1 = false;
                                  isClicked10 = false;
                                  isClicked11 = false;
                                  isClicked12 = false;
                                  isClicked13 = false;
                                  isClicked14 = false;
                                  isClicked15 = false;
                                  isClicked16 = false;
                                  isClicked17 = false;
                                  isClicked18 = false;
                                  isClicked19 = false;
                                  isClicked20 = false;
                                });
                              },
                              child: null,
                              style: ElevatedButton.styleFrom(
                                primary: AppColor.green4,
                                fixedSize: Size(1, 1),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(1)),
                      Expanded(
                        child: Center(
                          child: SizedBox(
                            height: (isClicked10) ? 30 : 20,
                            width: (isClicked10) ? 30 : 20,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _color = AppColor.green5;
                                  isClicked10 = true;
                                  isClicked2 = false;
                                  isClicked3 = false;
                                  isClicked4 = false;
                                  isClicked5 = false;
                                  isClicked6 = false;
                                  isClicked7 = false;
                                  isClicked8 = false;
                                  isClicked9 = false;
                                  isClicked1 = false;
                                  isClicked11 = false;
                                  isClicked12 = false;
                                  isClicked13 = false;
                                  isClicked14 = false;
                                  isClicked15 = false;
                                  isClicked16 = false;
                                  isClicked17 = false;
                                  isClicked18 = false;
                                  isClicked19 = false;
                                  isClicked20 = false;
                                });
                              },
                              child: null,
                              style: ElevatedButton.styleFrom(
                                primary: AppColor.green5,
                                fixedSize: Size(1, 1),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
                  Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 10)),
                  Container(
                      child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Center(
                          child: SizedBox(
                            height: (isClicked11) ? 30 : 20,
                            width: (isClicked11) ? 30 : 20,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _color = AppColor.purple1;
                                  isClicked11 = true;
                                  isClicked2 = false;
                                  isClicked3 = false;
                                  isClicked4 = false;
                                  isClicked5 = false;
                                  isClicked6 = false;
                                  isClicked7 = false;
                                  isClicked8 = false;
                                  isClicked9 = false;
                                  isClicked10 = false;
                                  isClicked1 = false;
                                  isClicked12 = false;
                                  isClicked13 = false;
                                  isClicked14 = false;
                                  isClicked15 = false;
                                  isClicked16 = false;
                                  isClicked17 = false;
                                  isClicked18 = false;
                                  isClicked19 = false;
                                  isClicked20 = false;
                                });
                              },
                              child: null,
                              style: ElevatedButton.styleFrom(
                                primary: AppColor.purple1,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(1)),
                      Expanded(
                        child: Center(
                          child: SizedBox(
                            height: (isClicked12) ? 30 : 20,
                            width: (isClicked12) ? 30 : 20,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _color = AppColor.purple2;
                                  isClicked12 = true;
                                  isClicked2 = false;
                                  isClicked3 = false;
                                  isClicked4 = false;
                                  isClicked5 = false;
                                  isClicked6 = false;
                                  isClicked7 = false;
                                  isClicked8 = false;
                                  isClicked9 = false;
                                  isClicked10 = false;
                                  isClicked11 = false;
                                  isClicked1 = false;
                                  isClicked13 = false;
                                  isClicked14 = false;
                                  isClicked15 = false;
                                  isClicked16 = false;
                                  isClicked17 = false;
                                  isClicked18 = false;
                                  isClicked19 = false;
                                  isClicked20 = false;
                                });
                              },
                              child: null,
                              style: ElevatedButton.styleFrom(
                                primary: AppColor.purple2,
                                fixedSize: Size(1, 1),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: SizedBox(
                            height: (isClicked13) ? 30 : 20,
                            width: (isClicked13) ? 30 : 20,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _color = AppColor.purple3;
                                  isClicked13 = true;
                                  isClicked2 = false;
                                  isClicked3 = false;
                                  isClicked4 = false;
                                  isClicked5 = false;
                                  isClicked6 = false;
                                  isClicked7 = false;
                                  isClicked8 = false;
                                  isClicked9 = false;
                                  isClicked10 = false;
                                  isClicked11 = false;
                                  isClicked12 = false;
                                  isClicked1 = false;
                                  isClicked14 = false;
                                  isClicked15 = false;
                                  isClicked16 = false;
                                  isClicked17 = false;
                                  isClicked18 = false;
                                  isClicked19 = false;
                                  isClicked20 = false;
                                });
                              },
                              child: null,
                              style: ElevatedButton.styleFrom(
                                primary: AppColor.purple3,
                                fixedSize: Size(1, 1),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: SizedBox(
                            height: (isClicked14) ? 30 : 20,
                            width: (isClicked14) ? 30 : 20,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _color = AppColor.purple4;
                                  isClicked14 = true;
                                  isClicked2 = false;
                                  isClicked3 = false;
                                  isClicked4 = false;
                                  isClicked5 = false;
                                  isClicked6 = false;
                                  isClicked7 = false;
                                  isClicked8 = false;
                                  isClicked9 = false;
                                  isClicked10 = false;
                                  isClicked11 = false;
                                  isClicked12 = false;
                                  isClicked13 = false;
                                  isClicked1 = false;
                                  isClicked15 = false;
                                  isClicked16 = false;
                                  isClicked17 = false;
                                  isClicked18 = false;
                                  isClicked19 = false;
                                  isClicked20 = false;
                                });
                              },
                              child: null,
                              style: ElevatedButton.styleFrom(
                                primary: AppColor.purple4,
                                fixedSize: Size(1, 1),
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Padding(padding: EdgeInsets.all(1)),
                      Expanded(
                        child: Center(
                          child: SizedBox(
                            height: (isClicked15) ? 30 : 20,
                            width: (isClicked15) ? 30 : 20,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _color = AppColor.purple5;
                                  isClicked15 = true;
                                  isClicked2 = false;
                                  isClicked3 = false;
                                  isClicked4 = false;
                                  isClicked5 = false;
                                  isClicked6 = false;
                                  isClicked7 = false;
                                  isClicked8 = false;
                                  isClicked9 = false;
                                  isClicked10 = false;
                                  isClicked11 = false;
                                  isClicked12 = false;
                                  isClicked13 = false;
                                  isClicked14 = false;
                                  isClicked1 = false;
                                  isClicked16 = false;
                                  isClicked17 = false;
                                  isClicked18 = false;
                                  isClicked19 = false;
                                  isClicked20 = false;
                                });
                              },
                              child: null,
                              style: ElevatedButton.styleFrom(
                                primary: AppColor.purple5,
                                fixedSize: Size(1, 1),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: SizedBox(
                            height: (isClicked16) ? 30 : 20,
                            width: (isClicked16) ? 30 : 20,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _color = AppColor.pink1;
                                  isClicked16 = true;
                                  isClicked2 = false;
                                  isClicked3 = false;
                                  isClicked4 = false;
                                  isClicked5 = false;
                                  isClicked6 = false;
                                  isClicked7 = false;
                                  isClicked8 = false;
                                  isClicked9 = false;
                                  isClicked10 = false;
                                  isClicked11 = false;
                                  isClicked12 = false;
                                  isClicked13 = false;
                                  isClicked14 = false;
                                  isClicked15 = false;
                                  isClicked1 = false;
                                  isClicked17 = false;
                                  isClicked18 = false;
                                  isClicked19 = false;
                                  isClicked20 = false;
                                });
                              },
                              child: null,
                              style: ElevatedButton.styleFrom(
                                primary: AppColor.pink1,
                                fixedSize: Size(1, 1),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(1)),
                      Expanded(
                        child: Center(
                          child: SizedBox(
                            height: (isClicked17) ? 30 : 20,
                            width: (isClicked17) ? 30 : 20,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _color = AppColor.pink2;
                                  isClicked17 = true;
                                  isClicked2 = false;
                                  isClicked3 = false;
                                  isClicked4 = false;
                                  isClicked5 = false;
                                  isClicked6 = false;
                                  isClicked7 = false;
                                  isClicked8 = false;
                                  isClicked9 = false;
                                  isClicked10 = false;
                                  isClicked11 = false;
                                  isClicked12 = false;
                                  isClicked13 = false;
                                  isClicked14 = false;
                                  isClicked15 = false;
                                  isClicked16 = false;
                                  isClicked1 = false;
                                  isClicked18 = false;
                                  isClicked19 = false;
                                  isClicked20 = false;
                                });
                              },
                              child: null,
                              style: ElevatedButton.styleFrom(
                                primary: AppColor.pink2,
                                fixedSize: Size(1, 1),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(1)),
                      Expanded(
                        child: Center(
                          child: SizedBox(
                            height: (isClicked18) ? 30 : 20,
                            width: (isClicked18) ? 30 : 20,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _color = AppColor.pink3;
                                  isClicked18 = true;
                                  isClicked2 = false;
                                  isClicked3 = false;
                                  isClicked4 = false;
                                  isClicked5 = false;
                                  isClicked6 = false;
                                  isClicked7 = false;
                                  isClicked8 = false;
                                  isClicked9 = false;
                                  isClicked10 = false;
                                  isClicked11 = false;
                                  isClicked12 = false;
                                  isClicked13 = false;
                                  isClicked14 = false;
                                  isClicked15 = false;
                                  isClicked16 = false;
                                  isClicked17 = false;
                                  isClicked1 = false;
                                  isClicked19 = false;
                                  isClicked20 = false;
                                });
                              },
                              child: null,
                              style: ElevatedButton.styleFrom(
                                primary: AppColor.pink3,
                                fixedSize: Size(1, 1),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(1)),
                      Expanded(
                        child: Center(
                          child: SizedBox(
                            height: (isClicked19) ? 30 : 20,
                            width: (isClicked19) ? 30 : 20,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _color = AppColor.pink4;
                                  isClicked19 = true;
                                  isClicked2 = false;
                                  isClicked3 = false;
                                  isClicked4 = false;
                                  isClicked5 = false;
                                  isClicked6 = false;
                                  isClicked7 = false;
                                  isClicked8 = false;
                                  isClicked9 = false;
                                  isClicked10 = false;
                                  isClicked11 = false;
                                  isClicked12 = false;
                                  isClicked13 = false;
                                  isClicked14 = false;
                                  isClicked15 = false;
                                  isClicked16 = false;
                                  isClicked17 = false;
                                  isClicked18 = false;
                                  isClicked1 = false;
                                  isClicked20 = false;
                                });
                              },
                              child: null,
                              style: ElevatedButton.styleFrom(
                                primary: AppColor.pink4,
                                fixedSize: Size(1, 1),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(1)),
                      Expanded(
                        child: Center(
                          child: SizedBox(
                            height: (isClicked20) ? 30 : 20,
                            width: (isClicked20) ? 30 : 20,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _color = AppColor.pink5;
                                  isClicked20 = true;
                                  isClicked2 = false;
                                  isClicked3 = false;
                                  isClicked4 = false;
                                  isClicked5 = false;
                                  isClicked6 = false;
                                  isClicked7 = false;
                                  isClicked8 = false;
                                  isClicked9 = false;
                                  isClicked10 = false;
                                  isClicked11 = false;
                                  isClicked12 = false;
                                  isClicked13 = false;
                                  isClicked14 = false;
                                  isClicked15 = false;
                                  isClicked16 = false;
                                  isClicked17 = false;
                                  isClicked18 = false;
                                  isClicked19 = false;
                                  isClicked1 = false;
                                });
                              },
                              child: null,
                              style: ElevatedButton.styleFrom(
                                primary: AppColor.pink5,
                                fixedSize: Size(1, 1),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 30, 0, 30),
                  ),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          if (_expenseKey.currentState!.validate()) {
                            Get.snackbar(
                              '추가완료!',
                              '지출 카테고리가 추가되었습니다.',
                              backgroundColor: Colors.white,
                            );
                            Get.offAll(() => MainPage());

                            final expense = new Category();
                            expense.name = _expenseController.text;
                            expense.color = _color;
                            expense.type = RecordType.spend;
                            addExpenseUseCase.invoke(expense);
                          }
                        },
                        child: const Text('등록하기'),
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xffF5B853),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0)),
                          fixedSize: Size(100, 50),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

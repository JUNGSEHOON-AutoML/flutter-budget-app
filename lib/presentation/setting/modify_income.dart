import 'package:account_book/domain/model/category.dart';
import 'package:account_book/domain/use_case/properties_use_case/update_category_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:account_book/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../domain/model/record.dart';
import '../../style.dart';

class ModifyIncome extends StatelessWidget {
  const ModifyIncome({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
        ),
        primarySwatch: Colors.indigo,
        fontFamily: 'Cabin',
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _updateIncomeController = TextEditingController();
  final updateIncomeUseCase=Get.put(UpdateCategoryUseCase());
  Color _color=Colors.white;
  bool isClicked1=false;bool isClicked2=false;bool isClicked3=false;bool isClicked4=false;bool isClicked5=false;
  bool isClicked6=false;bool isClicked7=false;bool isClicked8=false;bool isClicked9=false;bool isClicked10=false;


  @override
  void dispose() {
    _updateIncomeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('수입 카테고리 삭제',style: TextStyle(color:Color(0xff524D90)),),
          leading: IconButton(
              onPressed: () {
                // Navigator.pop(context); //뒤로가기
              },
              color: Color(0xff524D90),
              icon: Icon(Icons.arrow_back)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: ListView(
              children:[
                TextFormField(
                  decoration: const InputDecoration(
                    prefix: Text('이름'),
                    labelText: '입력하세요',
                  ),
                  controller: _updateIncomeController,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('색상'),
                ),

                Container(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Center(
                            child:
                            SizedBox(
                              height:(isClicked1)?30:20,
                              width:(isClicked1)?30:20,
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _color=AppColor.olive1;
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
                                  });
                                },
                                child: null,
                                style: ElevatedButton.styleFrom(
                                  primary:AppColor.olive1,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(1)),
                        Expanded(
                          child: Center(
                            child:
                            SizedBox(
                              height:(isClicked2)?30:20,
                              width:(isClicked2)?30:20,
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _color=AppColor.olive2;
                                    isClicked2=true;
                                    isClicked1=false;isClicked3=false;isClicked4=false;isClicked5=false;isClicked6=false;isClicked7=false;isClicked8=false;isClicked9=false;isClicked10=false;
                                  });
                                },
                                child: null,
                                style: ElevatedButton.styleFrom(
                                  primary:AppColor.olive2,
                                  fixedSize: Size(1,1),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: SizedBox(
                              height:(isClicked3)?30:20,
                              width:(isClicked3)?30:20,
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _color=AppColor.olive3;
                                    isClicked3=true;
                                    isClicked1=false;isClicked2=false;isClicked4=false;isClicked5=false;isClicked6=false;isClicked7=false;isClicked8=false;isClicked9=false;isClicked10=false;

                                  });
                                },
                                child: null,
                                style: ElevatedButton.styleFrom(
                                  primary:AppColor.olive3,
                                  fixedSize: Size(1,1),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: SizedBox(
                              height:(isClicked4)?30:20,
                              width:(isClicked4)?30:20,
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _color=AppColor.olive4;
                                    isClicked4=true;
                                    isClicked2=false;isClicked3=false;isClicked1=false;isClicked5=false;isClicked6=false;isClicked7=false;isClicked8=false;isClicked9=false;isClicked10=false;
                                  });
                                },
                                child: null,
                                style: ElevatedButton.styleFrom(
                                  primary:AppColor.olive4,
                                  fixedSize: Size(1,1),
                                ),
                              ),
                            ),
                          ),
                        ),
                        // Padding(padding: EdgeInsets.all(1)),
                        Expanded(
                          child: Center(
                            child: SizedBox(
                              height:(isClicked5)?30:20,
                              width:(isClicked5)?30:20,
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _color=AppColor.olive5;
                                    isClicked5=true;
                                    isClicked2=false;isClicked3=false;isClicked4=false;isClicked1=false;isClicked6=false;isClicked7=false;isClicked8=false;isClicked9=false;isClicked10=false;
                                  });
                                },
                                child: null,
                                style: ElevatedButton.styleFrom(
                                  primary:AppColor.olive5,
                                  fixedSize: Size(1,1),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: SizedBox(
                              height:(isClicked6)?30:20,
                              width:(isClicked6)?30:20,
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _color=AppColor.yellow1;
                                    isClicked6=true;
                                    isClicked2=false;isClicked3=false;isClicked4=false;isClicked5=false;isClicked1=false;isClicked7=false;isClicked8=false;isClicked9=false;isClicked10=false;
                                  });
                                },
                                child: null,
                                style: ElevatedButton.styleFrom(
                                  primary:AppColor.yellow1,
                                  fixedSize: Size(1,1),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(1)),
                        Expanded(
                          child: Center(
                            child: SizedBox(
                              height:(isClicked7)?30:20,
                              width:(isClicked7)?30:20,
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _color=AppColor.yellow2;
                                    isClicked7=true;
                                    isClicked2=false;isClicked3=false;isClicked4=false;isClicked5=false;isClicked6=false;isClicked1=false;isClicked8=false;isClicked9=false;isClicked10=false;
                                  });
                                },
                                child: null,
                                style: ElevatedButton.styleFrom(
                                  primary:AppColor.yellow2,
                                  fixedSize: Size(1,1),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(1)),
                        Expanded(
                          child: Center(
                            child: SizedBox(
                              height:(isClicked8)?30:20,
                              width:(isClicked8)?30:20,
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _color=AppColor.yellow3;
                                    isClicked8=true;
                                    isClicked2=false;isClicked3=false;isClicked4=false;isClicked5=false;isClicked6=false;isClicked7=false;isClicked1=false;isClicked9=false;isClicked10=false;
                                  });
                                },
                                child: null,
                                style: ElevatedButton.styleFrom(
                                  primary:AppColor.yellow3,
                                  fixedSize: Size(1,1),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(1)),
                        Expanded(
                          child: Center(
                            child: SizedBox(
                              height:(isClicked9)?30:20,
                              width:(isClicked9)?30:20,
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _color=AppColor.yellow4;
                                    isClicked9=true;
                                    isClicked2=false;isClicked3=false;isClicked4=false;isClicked5=false;isClicked6=false;isClicked7=false;isClicked8=false;isClicked1=false;isClicked10=false;
                                  });
                                },
                                child: null,
                                style: ElevatedButton.styleFrom(
                                  primary:AppColor.yellow4,
                                  fixedSize: Size(1,1),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(1)),
                        Expanded(
                          child: Center(
                            child: SizedBox(
                              height:(isClicked10)?30:20,
                              width:(isClicked10)?30:20,
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _color=AppColor.yellow5;
                                    isClicked10=true;
                                    isClicked2=false;isClicked3=false;isClicked4=false;isClicked5=false;isClicked6=false;isClicked7=false;isClicked8=false;isClicked9=false;isClicked1=false;
                                  });
                                },
                                child: null,
                                style: ElevatedButton.styleFrom(
                                  primary:AppColor.yellow5,
                                  fixedSize: Size(1,1),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                ),

                Container(
                  margin: EdgeInsets.fromLTRB(0, 30, 0, 30),
                ),

                ElevatedButton(
                    onPressed: (){
                      final updateincome=new Category();
                      updateincome.name=_updateIncomeController.text;
                      updateincome.color=_color;
                      updateincome.type=RecordType.income;
                      updateIncomeUseCase.invoke(updateincome);
                    },
                    child: const Text('등록하기'),
                    style: ElevatedButton.styleFrom(
                      primary:Color(0xffF5B853),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)
                      ),
                      fixedSize: Size(100,50),
                    )
                ),

              ],
            ),
          ),
        ),

        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(0xff524D90),
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.list_outlined,color: Colors.white38), label: '내역'),
            BottomNavigationBarItem(icon: Icon(Icons.calendar_month,color: Colors.white38), label: '달력'),
            BottomNavigationBarItem(icon: Icon(Icons.analytics_outlined,color: Colors.white38), label: '통계'),
            BottomNavigationBarItem(icon: Icon(Icons.settings,color: Colors.white38), label: '설정')
          ],
        ),
      ),
    );
  }
}
import 'package:account_book/domain/model/category.dart';
import 'package:account_book/domain/use_case/properties_use_case/delete_category_use_case.dart';
import 'package:account_book/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fast_color_picker/fast_color_picker.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../domain/model/record.dart';


class DeleteExpense extends StatelessWidget {
  const DeleteExpense({Key? key}) : super(key:key);

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
  final _deleteExpenseController = TextEditingController();
  final deleteExpenseUseCase=Get.put(DeleteCategoryUseCase());
  Color _color=Colors.white;
  bool isClicked1=false;bool isClicked2=false;bool isClicked3=false;bool isClicked4=false;bool isClicked5=false;
  bool isClicked6=false;bool isClicked7=false;bool isClicked8=false;bool isClicked9=false;bool isClicked10=false;
  bool isClicked11=false;bool isClicked12=false;bool isClicked13=false;bool isClicked14=false;bool isClicked15=false;
  bool isClicked16=false;bool isClicked17=false;bool isClicked18=false;bool isClicked19=false;bool isClicked20=false;

  @override
  void dispose() {
    _deleteExpenseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('지출 카테고리 삭제',style: TextStyle(color:Color(0xff524D90)),),
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
                  controller: _deleteExpenseController,
                  // keyboardType: TextInputType.name,
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
                                    _color=AppColor.blue1;
                                    isClicked1=true;
                                    isClicked2=false;isClicked3=false;isClicked4=false;isClicked5=false;isClicked6=false;isClicked7=false;isClicked8=false;isClicked9=false;isClicked10=false;isClicked11=false;isClicked12=false;isClicked13=false;isClicked14=false;isClicked15=false;isClicked16=false;isClicked17=false;isClicked18=false;isClicked19=false;isClicked20=false;
                                  });
                                },
                                child: null,
                                style: ElevatedButton.styleFrom(
                                  primary:AppColor.blue1,
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
                                    _color=AppColor.blue2;
                                    isClicked2=true;
                                    isClicked1=false;isClicked3=false;isClicked4=false;isClicked5=false;isClicked6=false;isClicked7=false;isClicked8=false;isClicked9=false;isClicked10=false;isClicked11=false;isClicked12=false;isClicked13=false;isClicked14=false;isClicked15=false;isClicked16=false;isClicked17=false;isClicked18=false;isClicked19=false;isClicked20=false;
                                  });
                                },
                                child: null,
                                style: ElevatedButton.styleFrom(
                                  primary:AppColor.blue2,
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
                                    _color=AppColor.blue3;
                                    isClicked3=true;
                                    isClicked1=false;isClicked2=false;isClicked4=false;isClicked5=false;isClicked6=false;isClicked7=false;isClicked8=false;isClicked9=false;isClicked10=false;isClicked11=false;isClicked12=false;isClicked13=false;isClicked14=false;isClicked15=false;isClicked16=false;isClicked17=false;isClicked18=false;isClicked19=false;isClicked20=false;

                                  });
                                },
                                child: null,
                                style: ElevatedButton.styleFrom(
                                  primary:AppColor.blue3,
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
                                    _color=AppColor.blue4;
                                    isClicked4=true;
                                    isClicked2=false;isClicked3=false;isClicked1=false;isClicked5=false;isClicked6=false;isClicked7=false;isClicked8=false;isClicked9=false;isClicked10=false;isClicked11=false;isClicked12=false;isClicked13=false;isClicked14=false;isClicked15=false;isClicked16=false;isClicked17=false;isClicked18=false;isClicked19=false;isClicked20=false;

                                  });
                                },
                                child: null,
                                style: ElevatedButton.styleFrom(
                                  primary:AppColor.blue4,
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
                                    _color=AppColor.blue5;
                                    isClicked5=true;
                                    isClicked2=false;isClicked3=false;isClicked4=false;isClicked1=false;isClicked6=false;isClicked7=false;isClicked8=false;isClicked9=false;isClicked10=false;isClicked11=false;isClicked12=false;isClicked13=false;isClicked14=false;isClicked15=false;isClicked16=false;isClicked17=false;isClicked18=false;isClicked19=false;isClicked20=false;

                                  });
                                },
                                child: null,
                                style: ElevatedButton.styleFrom(
                                  primary:AppColor.blue5,
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
                                    _color=AppColor.green1;
                                    isClicked6=true;
                                    isClicked2=false;isClicked3=false;isClicked4=false;isClicked5=false;isClicked1=false;isClicked7=false;isClicked8=false;isClicked9=false;isClicked10=false;isClicked11=false;isClicked12=false;isClicked13=false;isClicked14=false;isClicked15=false;isClicked16=false;isClicked17=false;isClicked18=false;isClicked19=false;isClicked20=false;

                                  });
                                },
                                child: null,
                                style: ElevatedButton.styleFrom(
                                  primary:AppColor.green1,
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
                                    _color=AppColor.green2;
                                    isClicked7=true;
                                    isClicked2=false;isClicked3=false;isClicked4=false;isClicked5=false;isClicked6=false;isClicked1=false;isClicked8=false;isClicked9=false;isClicked10=false;isClicked11=false;isClicked12=false;isClicked13=false;isClicked14=false;isClicked15=false;isClicked16=false;isClicked17=false;isClicked18=false;isClicked19=false;isClicked20=false;

                                  });
                                },
                                child: null,
                                style: ElevatedButton.styleFrom(
                                  primary:AppColor.green2,
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
                                    _color=AppColor.green3;
                                    isClicked8=true;
                                    isClicked2=false;isClicked3=false;isClicked4=false;isClicked5=false;isClicked6=false;isClicked7=false;isClicked1=false;isClicked9=false;isClicked10=false;isClicked11=false;isClicked12=false;isClicked13=false;isClicked14=false;isClicked15=false;isClicked16=false;isClicked17=false;isClicked18=false;isClicked19=false;isClicked20=false;

                                  });
                                },
                                child: null,
                                style: ElevatedButton.styleFrom(
                                  primary:AppColor.green3,
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
                                    _color=AppColor.green4;
                                    isClicked9=true;
                                    isClicked2=false;isClicked3=false;isClicked4=false;isClicked5=false;isClicked6=false;isClicked7=false;isClicked8=false;isClicked1=false;isClicked10=false;isClicked11=false;isClicked12=false;isClicked13=false;isClicked14=false;isClicked15=false;isClicked16=false;isClicked17=false;isClicked18=false;isClicked19=false;isClicked20=false;

                                  });
                                },
                                child: null,
                                style: ElevatedButton.styleFrom(
                                  primary:AppColor.green4,
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
                                    _color=AppColor.green5;
                                    isClicked10=true;
                                    isClicked2=false;isClicked3=false;isClicked4=false;isClicked5=false;isClicked6=false;isClicked7=false;isClicked8=false;isClicked9=false;isClicked1=false;isClicked11=false;isClicked12=false;isClicked13=false;isClicked14=false;isClicked15=false;isClicked16=false;isClicked17=false;isClicked18=false;isClicked19=false;isClicked20=false;

                                  });
                                },
                                child: null,
                                style: ElevatedButton.styleFrom(
                                  primary:AppColor.green5,
                                  fixedSize: Size(1,1),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                ),
                Padding(padding: EdgeInsets.fromLTRB(0,10,0,10)),
                Container(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Center(
                            child:
                            SizedBox(
                              height:(isClicked11)?30:20,
                              width:(isClicked11)?30:20,
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _color=AppColor.purple1;
                                    isClicked11=true;
                                    isClicked2=false;isClicked3=false;isClicked4=false;isClicked5=false;isClicked6=false;isClicked7=false;isClicked8=false;isClicked9=false;isClicked10=false;isClicked1=false;isClicked12=false;isClicked13=false;isClicked14=false;isClicked15=false;isClicked16=false;isClicked17=false;isClicked18=false;isClicked19=false;isClicked20=false;

                                  });
                                },
                                child: null,
                                style: ElevatedButton.styleFrom(
                                  primary:AppColor.purple1,
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
                              height:(isClicked12)?30:20,
                              width:(isClicked12)?30:20,
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _color=AppColor.purple2;
                                    isClicked12=true;
                                    isClicked2=false;isClicked3=false;isClicked4=false;isClicked5=false;isClicked6=false;isClicked7=false;isClicked8=false;isClicked9=false;isClicked10=false;isClicked11=false;isClicked1=false;isClicked13=false;isClicked14=false;isClicked15=false;isClicked16=false;isClicked17=false;isClicked18=false;isClicked19=false;isClicked20=false;

                                  });
                                },
                                child: null,
                                style: ElevatedButton.styleFrom(
                                  primary:AppColor.purple2,
                                  fixedSize: Size(1,1),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: SizedBox(
                              height:(isClicked13)?30:20,
                              width:(isClicked13)?30:20,
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _color=AppColor.purple3;
                                    isClicked13=true;
                                    isClicked2=false;isClicked3=false;isClicked4=false;isClicked5=false;isClicked6=false;isClicked7=false;isClicked8=false;isClicked9=false;isClicked10=false;isClicked11=false;isClicked12=false;isClicked1=false;isClicked14=false;isClicked15=false;isClicked16=false;isClicked17=false;isClicked18=false;isClicked19=false;isClicked20=false;

                                  });
                                },
                                child: null,
                                style: ElevatedButton.styleFrom(
                                  primary:AppColor.purple3,
                                  fixedSize: Size(1,1),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: SizedBox(
                              height:(isClicked14)?30:20,
                              width:(isClicked14)?30:20,
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _color=AppColor.purple4;
                                    isClicked14=true;
                                    isClicked2=false;isClicked3=false;isClicked4=false;isClicked5=false;isClicked6=false;isClicked7=false;isClicked8=false;isClicked9=false;isClicked10=false;isClicked11=false;isClicked12=false;isClicked13=false;isClicked1=false;isClicked15=false;isClicked16=false;isClicked17=false;isClicked18=false;isClicked19=false;isClicked20=false;

                                  });
                                },
                                child: null,
                                style: ElevatedButton.styleFrom(
                                  primary:AppColor.purple4,
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
                              height:(isClicked15)?30:20,
                              width:(isClicked15)?30:20,
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _color=AppColor.purple5;
                                    isClicked15=true;
                                    isClicked2=false;isClicked3=false;isClicked4=false;isClicked5=false;isClicked6=false;isClicked7=false;isClicked8=false;isClicked9=false;isClicked10=false;isClicked11=false;isClicked12=false;isClicked13=false;isClicked14=false;isClicked1=false;isClicked16=false;isClicked17=false;isClicked18=false;isClicked19=false;isClicked20=false;

                                  });
                                },
                                child: null,
                                style: ElevatedButton.styleFrom(
                                  primary:AppColor.purple5,
                                  fixedSize: Size(1,1),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: SizedBox(
                              height:(isClicked16)?30:20,
                              width:(isClicked16)?30:20,
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _color=AppColor.pink1;
                                    isClicked16=true;
                                    isClicked2=false;isClicked3=false;isClicked4=false;isClicked5=false;isClicked6=false;isClicked7=false;isClicked8=false;isClicked9=false;isClicked10=false;isClicked11=false;isClicked12=false;isClicked13=false;isClicked14=false;isClicked15=false;isClicked1=false;isClicked17=false;isClicked18=false;isClicked19=false;isClicked20=false;

                                  });
                                },
                                child: null,
                                style: ElevatedButton.styleFrom(
                                  primary:AppColor.pink1,
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
                              height:(isClicked17)?30:20,
                              width:(isClicked17)?30:20,
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _color=AppColor.pink2;
                                    isClicked17=true;
                                    isClicked2=false;isClicked3=false;isClicked4=false;isClicked5=false;isClicked6=false;isClicked7=false;isClicked8=false;isClicked9=false;isClicked10=false;isClicked11=false;isClicked12=false;isClicked13=false;isClicked14=false;isClicked15=false;isClicked16=false;isClicked1=false;isClicked18=false;isClicked19=false;isClicked20=false;

                                  });
                                },
                                child: null,
                                style: ElevatedButton.styleFrom(
                                  primary:AppColor.pink2,
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
                              height:(isClicked18)?30:20,
                              width:(isClicked18)?30:20,
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _color=AppColor.pink3;
                                    isClicked18=true;
                                    isClicked2=false;isClicked3=false;isClicked4=false;isClicked5=false;isClicked6=false;isClicked7=false;isClicked8=false;isClicked9=false;isClicked10=false;isClicked11=false;isClicked12=false;isClicked13=false;isClicked14=false;isClicked15=false;isClicked16=false;isClicked17=false;isClicked1=false;isClicked19=false;isClicked20=false;

                                  });
                                },
                                child: null,
                                style: ElevatedButton.styleFrom(
                                  primary:AppColor.pink3,
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
                              height:(isClicked19)?30:20,
                              width:(isClicked19)?30:20,
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _color=AppColor.pink4;
                                    isClicked19=true;
                                    isClicked2=false;isClicked3=false;isClicked4=false;isClicked5=false;isClicked6=false;isClicked7=false;isClicked8=false;isClicked9=false;isClicked10=false;isClicked11=false;isClicked12=false;isClicked13=false;isClicked14=false;isClicked15=false;isClicked16=false;isClicked17=false;isClicked18=false;isClicked1=false;isClicked20=false;

                                  });
                                },
                                child: null,
                                style: ElevatedButton.styleFrom(
                                  primary:AppColor.pink4,
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
                              height:(isClicked20)?30:20,
                              width:(isClicked20)?30:20,
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _color=AppColor.pink5;
                                    isClicked20=true;
                                    isClicked2=false;isClicked3=false;isClicked4=false;isClicked5=false;isClicked6=false;isClicked7=false;isClicked8=false;isClicked9=false;isClicked10=false;isClicked11=false;isClicked12=false;isClicked13=false;isClicked14=false;isClicked15=false;isClicked16=false;isClicked17=false;isClicked18=false;isClicked19=false;isClicked1=false;

                                  });
                                },
                                child: null,
                                style: ElevatedButton.styleFrom(
                                  primary:AppColor.pink5,
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
                      final deleteexpense=new Category();
                      deleteexpense.name=_deleteExpenseController.text;
                      deleteexpense.color=_color;
                      deleteexpense.type=RecordType.spend;
                      deleteExpenseUseCase.invoke(deleteexpense);
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
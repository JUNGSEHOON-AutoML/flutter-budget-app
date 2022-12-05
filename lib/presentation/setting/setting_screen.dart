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
  final dummylist1=[];
  final dummy1=Payment();
  final dummy2=Category();
  final dummy3=Category();

  @override
  void dispose() {
    _midController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // dummy1.name='test';
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
              '설정',
              style: TextStyle(color:Color(0xff524D90))),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: ListView(
              children:[
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
                    itemCount: dummylist1.length ?? 0,
                    itemBuilder: (BuildContext context, int i){
                      return ListTile(
                        title:TextButton(onPressed:(){},
                            child:Align(alignment: Alignment.centerLeft,child:Text(dummylist1[i].name,style:TextStyle(fontSize:16))),
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.all(0),
                          ),
                        ),
                      );
                  }
                ),

                CupertinoButton(onPressed: (){
                  Get.toNamed("/addaccount");
                  setState(() {
                    // dummy1.name='결제수단';
                    dummylist1.add(dummy1);
                  });
                },
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('결제수단 추가하기                                              +',style: TextStyle(color: AppColor.purple1),
                  )
                  ),
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                ),
                Container(height:1.0, color: AppColor.purple1),


                TextFormField(
                  decoration: const InputDecoration(
                    labelText: '지출 카테고리',
                    iconColor: Color(0xffA79FCB),
                  ),
                  controller: _midController,
                  enabled: false,
                  style: TextStyle(fontSize: 18)
                ),
          CupertinoButton(onPressed: (){
            Get.toNamed("/addexpense");
            dummy2.name='지출1';
            setState(() {

            });
            dummy2.color=AppColor.purple1;
            dummy2.type=RecordType.spend;
          },
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text('지출 카테고리 추가하기                                     +',
                  style: TextStyle(color: AppColor.purple1),
                )
            ),
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),

          ),
                Container(height:1.0, color: AppColor.purple1),

                TextFormField(
                  decoration: const InputDecoration(
                    labelText: '수입 카테고리',
                  ),
                  controller: _midController,
                  enabled: false,
                    style: TextStyle(fontSize: 18)
                ),
                CupertinoButton(onPressed: (){
                  Get.toNamed("/addincome");
                  dummy3.name='수입1';
                  dummy3.color=AppColor.purple1;
                  dummy3.type=RecordType.income;
                },
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('수입 카테고리 추가하기                                     +',
                        style: TextStyle(color: AppColor.purple1),
                      )
                  ),
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),

                ),
                Container(height:1.0, color: AppColor.purple1),

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
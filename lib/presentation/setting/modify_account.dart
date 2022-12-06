import 'package:account_book/domain/use_case/properties_use_case/update_payment_use_case.dart';
import 'package:account_book/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../domain/model/payment.dart';

class ModifyAccount extends StatelessWidget {
  const ModifyAccount({Key? key}) : super(key:key);

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
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _updatepaymentController = TextEditingController();
  final updatePaymentUseCase=Get.put(UpdatePaymentUseCase());

  @override
  void dispose() {
    _updatepaymentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          bottom: PreferredSize(
              child: Container(
                color: AppColor.purple1,
                height: 1.0,
              ),
              preferredSize: Size.fromHeight(4.0)),
          title: Text('결제 수단 수정하기',
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
            child: ListView(
              children:[
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '이름',
                  ),
                  controller: _updatepaymentController,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 30, 0, 30),
                ),
                ElevatedButton(
                    onPressed: (){
                      final updatepayment=new Payment();
                      updatepayment.name=_updatepaymentController.text;
                      updatePaymentUseCase.invoke(updatepayment);
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


      ),
    );
  }
}
import 'package:account_book/domain/use_case/properties_use_case/delete_payment_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../domain/model/payment.dart';

class DeleteAccount extends StatelessWidget {
  const DeleteAccount({Key? key}) : super(key:key);

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
  final _deletepayController = TextEditingController();
  final deletePaymentUseCase=Get.put(DeletePaymentUseCase());

  @override
  void dispose() {
    _deletepayController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('결제수단 삭제하기',style: TextStyle(color:Color(0xff524D90)),),
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
                    border: OutlineInputBorder(),
                    labelText: '이름',
                  ),
                  controller: _deletepayController,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 30, 0, 30),
                ),
                ElevatedButton(
                    onPressed: (){
                      final deletepayment=new Payment();
                      deletepayment.name=_deletepayController.text;
                      deletePaymentUseCase.invoke(deletepayment);
                    },
                    child: const Text('삭제하기'),
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
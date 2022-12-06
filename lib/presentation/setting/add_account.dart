import 'package:account_book/domain/model/payment.dart';
import 'package:account_book/domain/use_case/properties_use_case/add_payment_use_case.dart';
import 'package:account_book/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../main.dart';

class AddAccount extends StatelessWidget {
  const AddAccount({Key? key}) : super(key: key);

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
  final _paymentController = TextEditingController();
  final addPaymentUsecase = Get.put(AddPaymentUseCase());
  final _accountKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _paymentController.dispose();
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
          title: Text('결제 수단 추가하기',
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
              key: _accountKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: '이름',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '결제수단을 입력하세요';
                      }
                      return null;
                    },
                    controller: _paymentController,
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 30, 0, 30),
                  ),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          if (_accountKey.currentState!.validate()) {
                            Get.snackbar(
                              '추가완료!',
                              '결제수단이 추가되었습니다.',
                              backgroundColor: Colors.white,
                            );
                            final addpayment = Payment();
                            addpayment.name = _paymentController.text;
                            addPaymentUsecase.invoke(addpayment);
                            Get.offAll(() => MainPage());
                          }
                        },
                        child: const Text('등록하기'),
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xffF5B853),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0)),
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

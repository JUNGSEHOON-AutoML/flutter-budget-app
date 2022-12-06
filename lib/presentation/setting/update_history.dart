import 'package:account_book/domain/model/payment.dart';
import 'package:account_book/domain/use_case/properties_use_case/add_payment_use_case.dart';
import 'package:account_book/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class UpdateHistory extends StatelessWidget {
  const UpdateHistory({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return MyHomePage();
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _paymentController = TextEditingController();
  final addPaymentUsecase=Get.put(AddPaymentUseCase());

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
          title: Text('내역 수정하기',
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
                    labelText: '이름',
                  ),
                  controller: _paymentController,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 30, 0, 30),
                ),
                ElevatedButton(
                    onPressed: (){
                      final addpayment=new Payment();
                      addpayment.name=_paymentController.text;
                      addPaymentUsecase.invoke(addpayment);
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
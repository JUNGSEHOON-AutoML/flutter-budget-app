import 'package:account_book/domain/model/payment.dart';
import 'package:account_book/domain/use_case/properties_use_case/add_payment_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AddHistory extends StatelessWidget {
  const AddHistory({Key? key}) : super(key:key);

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
          title: const Text('내역 등록',style: TextStyle(color:Color(0xff524D90)),),
          leading: IconButton(
              onPressed: () {
                Get.back(); //뒤로가기
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
                    labelText: '일자',
                  ),
                  controller: _paymentController,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: '금액',
                  ),
                  controller: _paymentController,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: '결제수단',
                  ),
                  controller: _paymentController,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: '분류',
                  ),
                  controller: _paymentController,
                ),

                TextFormField(
                  decoration: const InputDecoration(
                    labelText: '내용',
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
import 'package:account_book/domain/model/payment.dart';
import 'package:account_book/domain/use_case/properties_use_case/add_payment_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import '../../style.dart';



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
  final formKey = GlobalKey<FormState>();
  TextEditingController dateController = TextEditingController();


  List<String> listOfValue = ['1', '2', '3', '4', '5'];
  String? _selectedValue;



  @override
  void dispose() {
    dateController.text="";
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
            child: Form(
              key: this.formKey,
              child: Padding(
              padding: EdgeInsets.all(10.0),
              child:Column(
              children:[
                TextField(
                  controller: dateController,
                  decoration: const InputDecoration(
                    // icon: Icon(Icons.calendar_today),
                    labelText: '일자',
                  ),
                  readOnly:true,
                  onTap:() async{
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(), //get today's date
                        firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime.now(),
                    );
                    if(pickedDate != null ){
                      print(pickedDate);  //get the picked date in the format => 2022-07-04 00:00:00.000
                      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                      print(formattedDate); //formatted date output using intl package =>  2022-07-04
                      //You can format date as per your need

                      setState(() {
                        dateController.text = formattedDate; //set foratted date to TextField value.
                      });
                    }else{
                      print("Date is not selected");
                    }
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: '금액',
                  ),
                  controller: _paymentController,
                  keyboardType: TextInputType.number,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                ),



                Container(
                  margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                ),


                  DropdownButtonFormField(
                    value: _selectedValue,
                    hint: Text(
                      '결제수단',
                    ),
                    isExpanded: true,
                    onChanged: (value) {
                      setState(() {
                        _selectedValue = value;
                      });
                    },
                    onSaved: (value) {
                      setState(() {
                        _selectedValue = value;
                      });
                    },

                    items: listOfValue
                        .map((String val) {
                      return DropdownMenuItem(
                        value: val,
                        child: Text(
                          val,
                        ),
                      );
                    }).toList(),
                  ),


                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                ),

                DropdownButtonFormField(
                  value: _selectedValue,
                  hint: Text(
                    '분류',
                  ),
                  isExpanded: true,
                  onChanged: (value) {
                    setState(() {
                      _selectedValue = value;
                    });
                  },
                  onSaved: (value) {
                    setState(() {
                      _selectedValue = value;
                    });
                  },

                  items: listOfValue
                      .map((String val) {
                    return DropdownMenuItem(
                      value: val,
                      child: Text(
                        val,
                      ),
                    );
                  }).toList(),
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
          ),
        ),

      ),
    );
  }
}
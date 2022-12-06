import 'package:account_book/di/my_service.dart';
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
  final _historyController = TextEditingController();
  final _moneyController = TextEditingController();
  final addPaymentUsecase=Get.put(AddPaymentUseCase());
  final _historyKey = GlobalKey<FormState>();
  TextEditingController dateController = TextEditingController();
  final List<bool> _selected = <bool>[true, true];

  String? _selectedValue;



  @override
  void dispose() {
    dateController.text="";
    _historyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const List<Widget> toggle = <Widget>[
      Text('수입'),
      Text('지출'),
    ];

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
              key: this._historyKey,
              child: Padding(
              padding: EdgeInsets.all(10.0),
              child:Column(
              children:[

                ToggleButtons(
                  onPressed: (int index) {
                    setState(() {
                      _selected[index] = !_selected[index];
                    });
                  },
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  selectedBorderColor: AppColor.purple1,
                  selectedColor: Colors.white,
                  fillColor: AppColor.purple1,
                  color: AppColor.purple1,
                  textStyle: const TextStyle(
                    fontSize: 20,
                  ),
                  constraints: const BoxConstraints(
                    minHeight: 40.0,
                    minWidth: 160.0,
                  ),
                  isSelected: _selected,
                  children: toggle,
                ),

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
                  controller: _historyController,
                  keyboardType: TextInputType.number,
                ),

                Container(
                  margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                ),

                Container(
                  margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                ),


                  DropdownButtonFormField2(
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    value: _selectedValue,
                    hint: const Text(
                      '결제수단',
                      style: TextStyle(fontSize:14),
                    ),
                    isExpanded: true,
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black45,
                    ),
                    iconSize: 30,
                    buttonHeight: 50,
                    buttonPadding: const EdgeInsets.only(left: 0, right: 10),
                    dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _selectedValue = value.toString();
                      });
                    },
                    onSaved: (value) {
                      setState(() {
                        _selectedValue = value.toString();
                      });
                    },

                    items: MyService.to.payments.keys.skip(1).map((key) => DropdownMenuItem(
                        value: MyService.to.payments[key]!.name,
                        child: Text(
                          MyService.to.payments[key]!.name,
                        ))).toList(),

                  ),

                Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                ),

                DropdownButtonFormField2(
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  value: _selectedValue,
                  hint: const Text(
                    '분류',
                    style: TextStyle(fontSize:14),
                  ),
                  isExpanded: true,
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black45,
                  ),
                  iconSize: 30,
                  buttonHeight: 50,
                  buttonPadding: const EdgeInsets.only(left: 0, right: 10),
                  dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _selectedValue = value.toString();
                    });
                  },
                  onSaved: (value) {
                    setState(() {
                      _selectedValue = value.toString();
                    });
                  },

                  items: MyService.to.payments.keys.skip(1).map((key) => DropdownMenuItem(
                      value: MyService.to.payments[key]!.name,
                      child: Text(
                        MyService.to.payments[key]!.name,
                      ))).toList(),

                ),
                

                TextFormField(
                  decoration: const InputDecoration(
                    labelText: '내용',
                  ),
                  controller: _historyController,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 30, 0, 30),
                ),
                SizedBox(
                  height:50,
                  width:double.infinity,
                  child: ElevatedButton(
                      onPressed: (){
                        if(_historyKey.currentState!.validate()){
                          Get.snackbar(
                            '추가완료!',
                            '내역이 추가되었습니다.',
                            backgroundColor: Colors.white,
                          );
                          // final income=new Category();
                          // income.name=_historyController.text;
                          // income.color=_color;
                          // income.type=RecordType.income;
                          // addIncomeUsecase.invoke(income);
                          // Get.offAll(()=>MainPage());

                        }

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
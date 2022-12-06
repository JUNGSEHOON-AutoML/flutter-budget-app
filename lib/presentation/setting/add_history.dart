import 'package:account_book/application/my_service.dart';
import 'package:account_book/domain/model/payment.dart';
import 'package:account_book/domain/use_case/history_use_case/add_record_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import '../../domain/model/category.dart';
import '../../domain/model/record.dart';
import '../../style.dart';
import '../main.dart';

class AddHistory extends StatelessWidget {
  const AddHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MyHomePage();
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
  final addRecordUseCase = Get.put(AddRecordUseCase());
  final _historyKey = GlobalKey<FormState>();
  TextEditingController dateController = TextEditingController();
  final List<bool> _selected = <bool>[true, false];
  var _payment;
  var _category;

  String? _selectedValue;

  @override
  void dispose() {
    dateController.text = "";
    _historyController.dispose();
    _moneyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const List<Widget> toggle = <Widget>[
      Text('수입'),
      Text('지출'),
    ];
    final incomeCategories = [];
    final spendCategories = [];

    for (final key in MyService.to.categories.keys) {
      if (MyService.to.categories[key]?.type == RecordType.income) {
        incomeCategories.add(MyService.to.categories[key]!);
      } else if (MyService.to.categories[key]?.type == RecordType.spend) {
        spendCategories.add(MyService.to.categories[key]!);
      }
    }

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(4.0),
              child: Container(
                color: AppColor.purple1,
                height: 1.0,
              )),
          title: const Text('내역 추가하기',
              style: TextStyle(
                fontSize: 18,
                color: AppColor.purple1,
              )),
          elevation: 0.0,
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColor.purple1,
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Form(
              key: _historyKey,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    ToggleButtons(
                      onPressed: (int index) {
                        setState(() {
                          for (int i = 0; i < _selected.length; i++) {
                            _selected[i] = i == index;
                          }
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
                    TextFormField(
                      controller: dateController,
                      decoration: const InputDecoration(
                        // icon: Icon(Icons.calendar_today),
                        labelText: '일자',
                      ),
                      readOnly: true,
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime.now(),
                        );
                        if (pickedDate != null) {
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                          setState(() {
                            dateController.text =
                                formattedDate; //set foratted date to TextField value.
                          });
                        } else {
                          Get.snackbar("Error", "Date is not selected");
                        }
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: '금액',
                      ),
                      controller: _moneyController,
                      keyboardType: TextInputType.number,
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                    ),
                    _selected[0]? Container() :
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
                        style: TextStyle(fontSize: 14),
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
                          _payment = value! as Payment;
                        });
                      },
                      items: MyService.to.payments.keys
                          .skip(1)
                          .map((key) => DropdownMenuItem<Payment>(
                              value: MyService.to.payments[key]!,
                              child: Text(
                                MyService.to.payments[key]!.name,
                              )))
                          .toList(),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
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
                        style: TextStyle(fontSize: 14),
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
                          _category = value! as Category;
                        });
                      },
                      items: MyService.to.categories.keys
                          .skip(1)
                          .where((element) {
                            return ((MyService.to.categories[element]?.type ==
                                        RecordType.income &&
                                    _selected[0]) ||
                                (MyService.to.categories[element]?.type ==
                                        RecordType.spend &&
                                    _selected[1]));
                          })
                          .map((key) => DropdownMenuItem<Category>(
                              value: MyService.to.categories[key]!,
                              child: Text(
                                MyService.to.categories[key]!.name,
                              )))
                          .toList(),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: '내용',
                      ),
                      controller: _historyController,
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                    ),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            final newPayment=Payment();
                            newPayment.id=1;
                            if (_historyKey.currentState!.validate()) {
                              Get.snackbar(
                                '추가완료!',
                                '내역이 추가되었습니다.',
                                backgroundColor: Colors.white,
                              );

                              addRecordUseCase.invoke(
                                  category: _category,
                                  type: _selected[0]
                                      ? RecordType.income
                                      : RecordType.spend,
                                  payment: _selected[0]?newPayment:_payment,
                                  price: int.parse(_moneyController.text),
                                  date: dateController.text,
                                  title: _historyController.text);
                              Get.back(closeOverlays: true);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xffF5B853),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0)),
                            fixedSize: const Size(100, 50),
                          ),
                          child: const Text('등록하기')),
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

import 'dart:ffi';
import 'package:account_book/domain/model/category.dart';

enum RecordType { income, spend }

/*
 * 가계부 내역
 * RecordType: 소비(spend), 지출 (income)
 * name: 내역 이름
 * price: 가격
 * category: 분류 (이름, 색상)
 * date: 연월일, 시간
 */
class Record {
  late final RecordType type;
  late final String name;
  late final Int price;
  late final Category category;
  late final DateTime date;
}

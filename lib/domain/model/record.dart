import 'dart:ffi';
import 'package:account_book/domain/model/category.dart';

enum RecordType { income, spend }

class Record {
  late final RecordType type;
  late final String name;
  late final Int price;
  late final Category category;
  late final DateTime date;
}

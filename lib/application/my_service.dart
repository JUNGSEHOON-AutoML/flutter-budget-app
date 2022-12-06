import 'dart:ui';

import 'package:account_book/data/database/local_database.dart';
import 'package:account_book/domain/model/category.dart';
import 'package:account_book/domain/model/payment.dart';
import 'package:account_book/domain/model/record.dart';
import 'package:account_book/style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class MyService extends GetxService {
  static MyService get to => Get.find();

  late final User me;
  late final AppDatabase localDatabase;

  var history = <String, List<Record>>{}.obs;

  var currentYear = 2022;
  var currentMonth = 12;

  final _colors = <RecordType, Map<int, Color>>{
    RecordType.spend: {-1: AppColor.unknown},
    RecordType.income: {-1: AppColor.unknown}
  };

  final categories = <int, Category>{}.obs;
  final payments = <int, Payment>{}.obs;

  static Future<void> init() async {
    await MyService.to._initLocalDB();
    MyService.to.initCategory();
    MyService.to._initColor();
    MyService.to.initPayment();
  }

  Future<void> _initLocalDB() async {
    localDatabase =
    await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  }

  void initCategory() {
    final unKnownCategory = Category();
    unKnownCategory.id = -1;
    unKnownCategory.name = "Unknown";

    categories[unKnownCategory.id] = unKnownCategory;
  }

  void _initColor() {
    _colors[RecordType.spend]!.addAll({
      0: AppColor.blue1,
      1: AppColor.blue2,
      2: AppColor.blue3,
      3: AppColor.blue4,
      4: AppColor.blue5,
      5: AppColor.green1,
      6: AppColor.green2,
      7: AppColor.green3,
      8: AppColor.green4,
      9: AppColor.green5,
      10: AppColor.purple1,
      11: AppColor.purple2,
      12: AppColor.purple3,
      13: AppColor.purple4,
      14: AppColor.purple5,
      15: AppColor.pink1,
      16: AppColor.pink2,
      17: AppColor.pink3,
      18: AppColor.pink4,
      19: AppColor.pink5,
    });

    _colors[RecordType.income]!.addAll({
      0: AppColor.olive1,
      1: AppColor.olive2,
      2: AppColor.olive3,
      3: AppColor.olive4,
      4: AppColor.olive5,
      5: AppColor.yellow1,
      6: AppColor.yellow2,
      7: AppColor.yellow3,
      8: AppColor.yellow4,
      9: AppColor.yellow5,
    });
  }

  void initPayment() {
    final unknownPayment = Payment();
    unknownPayment.id = -1;
    unknownPayment.name = "Unknown";

    payments[unknownPayment.id] = unknownPayment;
  }

  Color getColorById({required RecordType type, required int id}) {
    if (!_colors[type]!.containsKey(id)) {
      return AppColor.unknown;
    } else {
      return _colors[type]![id]!;
    }
  }

  int getIdByColor({required RecordType type, required Color color}) {
    if (_colors[type] != null) {
      for (final key in _colors[type]!.keys) {
        if (_colors[type]![key] == color) {
          return key;
        }
      }
    }
    return -1;
  }

  Category getCategoryById({required int id}) {
    if (categories.containsKey(id)) {
      return categories[id]!;
    } else {
      return categories[-1]!;
    }
  }

  Payment getPaymentById({required int id}) {
    if (payments.containsKey(id)) {
      return payments[id]!;
    } else {
      return payments[-1]!;
    }
  }
}
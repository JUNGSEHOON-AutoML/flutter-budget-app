import 'dart:ui';

import 'package:account_book/domain/model/record.dart';
import 'package:account_book/style.dart';
import 'package:get/get.dart';

class ColorController extends GetxController {
  final _colors = <RecordType, Map<int, Color>>{
    RecordType.spend: {-1: AppColor.unknown},
    RecordType.income: {-1: AppColor.unknown}
  };

  ColorController() {
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

  Color getColorById({required RecordType type, required int id}) {
    if (!_colors[type]!.containsKey(id)) {
      return AppColor.unknown;
    } else {
      return _colors[type]![id]!;
    }
  }
}

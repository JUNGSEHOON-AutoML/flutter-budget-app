import 'dart:ui';

import 'package:account_book/data/entity/CategoryEntity.dart';
import 'package:account_book/application/my_service.dart';
import 'package:account_book/domain/model/record.dart';

class Category {
  late final int id;
  late final String name;
  late final Color color;
  var type = RecordType.income;

  CategoryEntity toEntity() {
    return CategoryEntity(id, name, type.name,
        MyService.to.getIdByColor(type: type, color: color));
  }
}

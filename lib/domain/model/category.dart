import 'dart:ui';

import 'package:account_book/data/entity/CategoryEntity.dart';
import 'package:account_book/di/my_service.dart';
import 'package:account_book/domain/model/record.dart';

class Category {
  late final int id;
  late final String name;
  late final Color color;
  late final RecordType type;

  CategoryEntity toEntity() {
    return CategoryEntity(id, name, type.name,
        MyService.to.getIdByColor(type: type, color: color));
  }
}

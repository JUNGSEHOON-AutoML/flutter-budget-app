import 'dart:async';

import 'package:account_book/data/dao/CategoryDao.dart';
import 'package:account_book/data/dao/PaymentDao.dart';
import 'package:account_book/data/entity/CategoryEntity.dart';
import 'package:account_book/data/entity/PaymentEntity.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'local_database.g.dart';

@Database(version: 1, entities: [CategoryEntity, PaymentEntity])
abstract class AppDatabase extends FloorDatabase {
  PaymentDao get paymentDao;

  CategoryDao get categoryDao;
}

import 'package:floor/floor.dart';
import 'package:tutorialapp/data/dao/user_dao.dart';
import 'package:tutorialapp/model/user.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';

part 'app_database.g.dart';

//flutter pub run build_runner watch

@Database(version: 1, entities: [User])
abstract class AppDatabase extends FloorDatabase {
  UserDao get userDao;

  Future<AppDatabase> getInstance() async {
    return $FloorAppDatabase.databaseBuilder('app_database.db').build();
  }
}

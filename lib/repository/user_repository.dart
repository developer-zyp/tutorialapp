import 'package:tutorialapp/data/app_database.dart';
import 'package:tutorialapp/model/user.dart';

class UserRepository {
  AppDatabase appDatabase;

  UserRepository({required this.appDatabase});

  Stream<List<User>> getAllUser() => appDatabase.userDao.getAll();
}

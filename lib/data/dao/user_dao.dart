import 'package:floor/floor.dart';

import '../../model/user.dart';

@dao
abstract class UserDao {
  @Query('select * from user')
  Stream<List<User>> getAll();

  @Query('select * from user where id = :id')
  Future<User?> getById(int id);

  @insert
  Future<void> insertItem(User item);

  @update
  Future<void> updateItem(User item);

  @delete
  Future<void> deleteItem(User item);

  @Query('delete from user')
  Future<void> deleteAll();
}

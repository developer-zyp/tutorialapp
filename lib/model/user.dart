import 'package:floor/floor.dart';

@Entity(tableName: 'user')
class User {
  @PrimaryKey(autoGenerate: true)
  int? id;
  String? email;
  @ColumnInfo(name: 'first_name')
  String? firstName;
  @ColumnInfo(name: 'last_name')
  String? lastName;
  String? avatar;

  User(this.email, this.firstName, this.lastName, this.avatar, {this.id});
}

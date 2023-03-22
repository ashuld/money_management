import 'package:hive_flutter/hive_flutter.dart';
part 'userdata.g.dart';

@HiveType(typeId: 2)
class UserModel extends HiveObject {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String phn;
  @HiveField(3)
  String mail;
  @HiveField(4)
  String password;
  UserModel(
      {required this.name,
      required this.phn,
      required this.mail,
      required this.password,
      this.id});
}

import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel extends HiveObject {
  @HiveField(0)
  final String? name;

  @HiveField(1)
  final String? address;

  @HiveField(2)
  final String? phoneNumber;

  @HiveField(3)
  final String? path;

  @HiveField(4)
  final double? latitude;

  @HiveField(5)
  final double? longitude;

  UserModel(
      {this.name,
      this.address,
      this.phoneNumber,
      this.path,
      this.latitude,
      this.longitude});
}

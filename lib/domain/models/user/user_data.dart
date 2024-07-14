import 'package:betonchel_manager/domain/models/user/user_role.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_data.g.dart';

@JsonSerializable(createFactory: false)
class UserData {
  final String email;
  final String fullName;
  final String password;
  final UserRole role;

  UserData({
    required this.email,
    required this.fullName,
    required this.password,
    required this.role,
  });

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}

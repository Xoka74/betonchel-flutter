import 'package:betonchel_manager/domain/models/user/user_role.dart';
import 'package:json_annotation/json_annotation.dart';

part 'employee_data.g.dart';

@JsonSerializable(createFactory: false)
class EmployeeData {
  final String email;
  final String fullName;
  final String password;
  final UserRole role;

  EmployeeData({
    required this.email,
    required this.fullName,
    required this.password,
    required this.role,
  });

  Map<String, dynamic> toJson() => _$EmployeeDataToJson(this);
}

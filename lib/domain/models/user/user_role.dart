import 'package:json_annotation/json_annotation.dart';

part 'user_role.g.dart';

@JsonEnum(alwaysCreate: true)
enum UserRole {
  @JsonValue('Admin')
  admin,
  @JsonValue('Manager')
  manager;
}

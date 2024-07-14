import 'package:json_annotation/json_annotation.dart';

part 'user_role.g.dart';

@JsonEnum(alwaysCreate: true)
enum UserRole {
  @JsonValue('admin')
  admin,
  @JsonValue('manager')
  manager;
}

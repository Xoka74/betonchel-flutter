import 'package:betonchel_manager/domain/models/user/user_role.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(createToJson: false)
class User extends Equatable {
  final int id;
  final String email;
  final String username;
  final UserRole role;

  const User({
    required this.id,
    required this.email,
    required this.username,
    required this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  @override
  List<Object?> get props => [
        id,
        email,
        username,
        role,
      ];
}

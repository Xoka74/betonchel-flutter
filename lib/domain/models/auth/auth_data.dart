import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_data.g.dart';

@JsonSerializable(createToJson: false)
class AuthData extends Equatable {
  @JsonKey(name: 'access_token')
  final String accessToken;
  @JsonKey(name: 'refresh_token')
  final String refreshToken;

  const AuthData({
    required this.accessToken,
    required this.refreshToken,
  });

  factory AuthData.fromJson(Map<String, dynamic> json) => _$AuthDataFromJson(json);

  @override
  List<Object?> get props => [
        accessToken,
        refreshToken,
      ];
}

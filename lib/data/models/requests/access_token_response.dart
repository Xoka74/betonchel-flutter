import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'access_token_response.g.dart';

@JsonSerializable(createFactory: true)
class AccessTokenResponse extends Equatable {
  @JsonKey(name: 'access')
  final String accessToken;

  const AccessTokenResponse({
    required this.accessToken,
  });

  factory AccessTokenResponse.fromJson(Map<String, dynamic> json) => _$AccessTokenResponseFromJson(json);

  @override
  List<Object?> get props => [
        accessToken,
      ];
}

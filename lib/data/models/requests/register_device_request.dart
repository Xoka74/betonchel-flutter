import 'package:betonchel_manager/data/models/enums/device_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_device_request.g.dart';

@JsonSerializable(
  createFactory: false,
  includeIfNull: false,
)
class RegisterDeviceRequest {
  @JsonKey(name: 'registration_id')
  final String registrationId;
  final DeviceType type;
  final String? name;

  RegisterDeviceRequest({
    required this.registrationId,
    required this.type,
    this.name,
  });

  Map<String, dynamic> toJson() => _$RegisterDeviceRequestToJson(this);
}

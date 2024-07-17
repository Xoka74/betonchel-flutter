import 'package:json_annotation/json_annotation.dart';

part 'device_type.g.dart';

@JsonEnum(alwaysCreate: true)
enum DeviceType {
  @JsonValue('android')
  android,
  @JsonValue('ios')
  ios,
  @JsonValue('web')
  web;
}

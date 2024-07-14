import 'package:json_annotation/json_annotation.dart';

part 'order_status.g.dart';

@JsonEnum(alwaysCreate: true)
enum OrderStatus {
  @JsonValue('CR')
  created,
  @JsonValue('IP')
  inProcess,
  @JsonValue('SF')
  successfullyFinished,
  @JsonValue('RJ')
  rejected;
}

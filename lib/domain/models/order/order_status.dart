import 'package:json_annotation/json_annotation.dart';

part 'order_status.g.dart';

@JsonEnum(alwaysCreate: true)
enum OrderStatus {
  @JsonValue(1)
  created,
  @JsonValue(2)
  inProcess,
  @JsonValue(3)
  successfullyFinished,
  @JsonValue(4)
  rejected;
}

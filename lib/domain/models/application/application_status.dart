import 'package:json_annotation/json_annotation.dart';

part 'application_status.g.dart';

@JsonEnum(alwaysCreate: true)
enum ApplicationStatus {
  @JsonValue('created')
  created,
  @JsonValue('pending')
  pending,
  @JsonValue('finished')
  finished,
  @JsonValue('unknown')
  unknown,
  @JsonValue('cancelled')
  cancelled;
}

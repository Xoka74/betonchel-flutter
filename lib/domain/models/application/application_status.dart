import 'package:json_annotation/json_annotation.dart';

part 'application_status.g.dart';

@JsonEnum(alwaysCreate: true)
enum ApplicationStatus {
  @JsonValue('Created')
  created,
  @JsonValue('InProcess')
  inProcess,
  @JsonValue('SuccessfullyFinished')
  successfullyFinished,
  @JsonValue('Rejected')
  rejected;
}

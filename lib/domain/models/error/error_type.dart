import 'package:betonchel_manager/domain/models/error/error_keys.dart';
import 'package:json_annotation/json_annotation.dart';

part 'error_type.g.dart';

@JsonEnum(alwaysCreate: true)
enum ErrorType {
  @JsonValue(ErrorKeys.concreteGradeNotExist)
  concreteGradeNotExist,
  @JsonValue(ErrorKeys.applicationHasConcreteGrade)
  applicationHasConcreteGrade,
  @JsonValue(ErrorKeys.unexpectedError)
  unexpectedError;
}

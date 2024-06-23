import 'package:json_annotation/json_annotation.dart';

part 'concrete_grade_type.g.dart';

@JsonEnum(alwaysCreate: true)
enum ConcreteGradeType {
  @JsonValue('Common')
  common,
  @JsonValue('Fine')
  fine,
}

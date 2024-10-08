import 'package:betonchel_manager/domain/models/concrete/concrete_grade_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'concrete_grade_data.g.dart';

@JsonSerializable(createFactory: false)
class ConcreteGradeData {
  final ConcreteGradeType name;
  final String mark;
  @JsonKey(name: 'class')
  final String clazz;
  final String waterproofType;
  final String frostResistanceType;
  final double pricePerCubicMeter;

  const ConcreteGradeData({
    required this.name,
    required this.mark,
    required this.clazz,
    required this.pricePerCubicMeter,
    required this.waterproofType,
    required this.frostResistanceType,
  });

  Map<String, dynamic> toJson() => _$ConcreteGradeDataToJson(this);
}

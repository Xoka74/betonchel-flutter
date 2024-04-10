import 'package:betonchel_manager/domain/models/concrete/frost_resistance_type.dart';
import 'package:betonchel_manager/domain/models/concrete/waterproof_type.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'concrete_grade.g.dart';

@JsonSerializable(createToJson: false)
class ConcreteGrade extends Equatable {
  final int id;
  final String mark;
  final String clazz;
  final double pricePerCubicMeter;

  final WaterproofType waterproofType;
  final FrostResistanceType frostResistanceType;

  const ConcreteGrade({
    required this.id,
    required this.mark,
    required this.clazz,
    required this.pricePerCubicMeter,
    required this.waterproofType,
    required this.frostResistanceType,
  });

  factory ConcreteGrade.fromJson(Map<String, dynamic> json) => _$ConcreteGradeFromJson(json);

  @override
  List<Object?> get props => [
        id,
        mark,
        clazz,
        pricePerCubicMeter,
        waterproofType,
        frostResistanceType,
      ];
}

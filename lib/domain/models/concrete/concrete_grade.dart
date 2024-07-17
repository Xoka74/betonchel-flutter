import 'package:betonchel_manager/domain/models/concrete/concrete_grade_type.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'concrete_grade.g.dart';

@JsonSerializable(createToJson: false)
class ConcreteGrade extends Equatable {
  final int id;
  final ConcreteGradeType name;
  final String mark;
  final String clazz;
  @JsonKey(name: 'waterproof_type')
  final String? waterproofType;
  @JsonKey(name: 'frost_resistance_type')
  final String? frostResistanceType;
  @JsonKey(name: 'price_for_cube')
  final double priceForCube;

  const ConcreteGrade({
    required this.id,
    required this.name,
    required this.mark,
    required this.clazz,
    required this.priceForCube,
    required this.waterproofType,
    required this.frostResistanceType,
  });

  factory ConcreteGrade.fromJson(Map<String, dynamic> json) => _$ConcreteGradeFromJson(json);

  @override
  List<Object?> get props => [
        id,
        mark,
        clazz,
        priceForCube,
        waterproofType,
        frostResistanceType,
      ];
}

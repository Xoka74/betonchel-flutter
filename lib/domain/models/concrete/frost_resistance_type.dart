import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'frost_resistance_type.g.dart';

@JsonSerializable(createToJson: false)
class FrostResistanceType extends Equatable {
  final int id;
  final String name;

  const FrostResistanceType({
    required this.id,
    required this.name,
  });

  factory FrostResistanceType.fromJson(Map<String, dynamic> json) => _$FrostResistanceTypeFromJson(json);

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}

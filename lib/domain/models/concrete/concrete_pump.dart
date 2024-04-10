import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'concrete_pump.g.dart';

@JsonSerializable(createToJson: false)
class ConcretePump extends Equatable {
  final int id;
  final double maximumCapacity;
  final double? pipeLength;
  final double pricePerHour;

  const ConcretePump({
    required this.id,
    required this.maximumCapacity,
    required this.pipeLength,
    required this.pricePerHour,
  });

  factory ConcretePump.fromJson(Map<String, dynamic> json) => _$ConcretePumpFromJson(json);

  @override
  List<Object?> get props => [
        id,
        maximumCapacity,
        pipeLength,
        pricePerHour,
      ];
}

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'waterproof_type.g.dart';

@JsonSerializable(createToJson: false)
class WaterproofType extends Equatable {
  final int id;
  final String name;

  const WaterproofType({
    required this.id,
    required this.name,
  });

  factory WaterproofType.fromJson(Map<String, dynamic> json) => _$WaterproofTypeFromJson(json);

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'application_dto.g.dart';

@JsonSerializable(createToJson: false)
class ApplicationDto extends Equatable {
  @override
  List<Object?> get props => [];
}

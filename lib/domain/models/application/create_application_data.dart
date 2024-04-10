import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_application_data.g.dart';

@JsonSerializable(createFactory: false)
class CreateApplicationData extends Equatable {
  @override
  List<Object?> get props => [];

  Map<String, dynamic> toJson() => _$CreateApplicationDataToJson(this);
}

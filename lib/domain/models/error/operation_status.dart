import 'package:betonchel_manager/domain/models/error/error_type.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'operation_status.g.dart';

@JsonSerializable(createToJson: false)
class OperationStatus extends Equatable {
  final bool success;
  final ErrorType? error;

  const OperationStatus({
    required this.success,
    this.error,
  });

  factory OperationStatus.fromJson(Map<String, dynamic> json) => _$OperationStatusFromJson(json);

  @override
  List<Object?> get props => [
        success,
        error,
      ];
}

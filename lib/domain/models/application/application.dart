import 'package:betonchel_manager/domain/models/application/application_status.dart';
import 'package:betonchel_manager/domain/models/concrete/concrete_grade.dart';
import 'package:betonchel_manager/domain/models/concrete/concrete_pump.dart';
import 'package:betonchel_manager/domain/models/user/user.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'application.g.dart';

@JsonSerializable(createToJson: false)
class Application extends Equatable {
  final int id;
  final User creator;
  final String customerName;
  final double totalPrice;
  final double volume;
  final String? deliveryAddress;
  final DateTime creationDate;
  final DateTime deliveryDate;
  final ConcretePump? concretePump;
  final ConcreteGrade? concreteGrade;
  final ApplicationStatus status;

  const Application({
    required this.id,
    required this.creator,
    required this.customerName,
    required this.totalPrice,
    required this.volume,
    required this.deliveryAddress,
    required this.creationDate,
    required this.deliveryDate,
    required this.concretePump,
    required this.concreteGrade,
    required this.status,
  });

  factory Application.fromJson(Map<String, dynamic> json) => _$ApplicationFromJson(json);

  @override
  List<Object?> get props => [
        id,
        creator,
        customerName,
        totalPrice,
        volume,
        deliveryAddress,
        creationDate,
        deliveryDate,
        concretePump,
        concreteGrade,
        status,
      ];
}

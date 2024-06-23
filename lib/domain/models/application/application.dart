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

  final User user;
  final String customerName;
  final String contactData;
  final String description;
  final double totalPrice;
  final double volume;
  final String? deliveryAddress;

  final DateTime deliveryDate;
  final ConcretePump? concretePump;
  final ConcreteGrade concreteGrade;
  final ApplicationStatus status;

  const Application({
    required this.id,
    required this.description,
    required this.customerName,
    required this.contactData,
    required this.totalPrice,
    required this.volume,
    required this.deliveryAddress,
    required this.deliveryDate,
    required this.concretePump,
    required this.concreteGrade,
    required this.status,
    required this.user,
  });

  factory Application.fromJson(Map<String, dynamic> json) => _$ApplicationFromJson(json);

  @override
  List<Object?> get props => [
        id,
        description,
        customerName,
        contactData,
        totalPrice,
        volume,
        deliveryAddress,
        deliveryDate,
        concretePump,
        concreteGrade,
        status,
        user,
      ];
}

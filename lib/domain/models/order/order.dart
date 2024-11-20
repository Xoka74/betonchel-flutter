import 'package:betonchel_manager/domain/models/concrete/concrete_grade.dart';
import 'package:betonchel_manager/domain/models/customer/customer.dart';
import 'package:betonchel_manager/domain/models/location/location.dart';
import 'package:betonchel_manager/domain/models/order/order_status.dart';
import 'package:betonchel_manager/domain/models/user/user.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order.g.dart';

@JsonSerializable(createToJson: false)
class Order extends Equatable {
  final int id;
  final User user;
  final String description;
  @JsonKey(name: 'total_price')
  final double totalPrice;
  final double volume;
  @JsonKey(name: 'delivery_datetime')
  final DateTime deliveryDateTime;
  @JsonKey(name: 'creation_datetime')
  final DateTime creationDateTime;
  @JsonKey(name: 'concrete_grade')
  final ConcreteGrade concreteGrade;
  final Customer customer;
  final Location location;
  final OrderStatus status;

  const Order({
    required this.id,
    required this.description,
    required this.totalPrice,
    required this.volume,
    required this.deliveryDateTime,
    required this.creationDateTime,
    required this.concreteGrade,
    required this.customer,
    required this.location,
    required this.status,
    required this.user,
  });

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  @override
  List<Object?> get props => [
        id,
        description,
        totalPrice,
        volume,
        deliveryDateTime,
        creationDateTime,
        concreteGrade,
        customer,
        location,
        status,
        user,
      ];
}

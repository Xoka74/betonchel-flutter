import 'package:betonchel_manager/domain/models/concrete/concrete_grade.dart';
import 'package:betonchel_manager/domain/models/order/order_status.dart';
import 'package:betonchel_manager/domain/models/user/user.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order.g.dart';

@JsonSerializable(createToJson: false)
class Order extends Equatable {
  final int id;

  final User user;
  @JsonKey(name: 'customer_name')
  final String customerName;
  @JsonKey(name: 'customer_contact_data')
  final String contactData;
  final String description;
  @JsonKey(name: 'total_price')
  final double totalPrice;
  final double volume;
  @JsonKey(name: 'customer_address')
  final String? deliveryAddress;
  @JsonKey(name: 'delivery_datetime')
  final DateTime deliveryDateTime;
  @JsonKey(name: 'creation_datetime')
  final DateTime creationDateTime;
  @JsonKey(name: 'concrete_grade')
  final ConcreteGrade concreteGrade;
  final OrderStatus status;

  const Order({
    required this.id,
    required this.description,
    required this.customerName,
    required this.contactData,
    required this.totalPrice,
    required this.volume,
    required this.deliveryAddress,
    required this.deliveryDateTime,
    required this.creationDateTime,
    required this.concreteGrade,
    required this.status,
    required this.user,
  });

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  @override
  List<Object?> get props => [
        id,
        description,
        customerName,
        contactData,
        totalPrice,
        volume,
        deliveryAddress,
        deliveryDateTime,
        creationDateTime,
        concreteGrade,
        status,
        user,
      ];
}

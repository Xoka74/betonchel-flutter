import 'package:betonchel_manager/domain/models/order/order_status.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_data.g.dart';

@JsonSerializable(createFactory: false)
class OrderData {
  final String customerName;

  final int concreteGradeId;

  final double totalPrice;

  final String contactData;

  final double volume;

  final String? deliveryAddress;

  final DateTime deliveryDate;

  final String description;

  final OrderStatus status;

  const OrderData({
    required this.customerName,
    required this.concreteGradeId,
    required this.totalPrice,
    required this.contactData,
    required this.volume,
    required this.deliveryAddress,
    required this.deliveryDate,
    required this.description,
    required this.status,
  });

  Map<String, dynamic> toJson() => _$OrderDataToJson(this);
}

import 'package:betonchel_manager/domain/models/order/order_status.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_data.g.dart';

@JsonSerializable(createFactory: false)
class OrderData {
  @JsonKey(name: 'customer_name')
  final String customerName;

  @JsonKey(name: 'customer_address_name')
  final String customerAddressName;

  @JsonKey(name: 'customer_address_latitude')
  final double customerAddressLatitude;

  @JsonKey(name: 'customer_address_longitude')
  final double customerAddressLongitude;

  @JsonKey(name: 'customer_contact_data')
  final String customerContactData;

  @JsonKey(name: 'concrete_grade')
  final int concreteGradeId;

  @JsonKey(name: 'total_price')
  final double totalPrice;

  final double volume;

  final DateTime deliveryDate;

  final String description;

  final OrderStatus status;

  OrderData({
    required this.customerName,
    required this.customerAddressName,
    required this.customerAddressLatitude,
    required this.customerAddressLongitude,
    required this.customerContactData,
    required this.concreteGradeId,
    required this.totalPrice,
    required this.volume,
    required this.deliveryDate,
    required this.description,
    required this.status,
  });

  Map<String, dynamic> toJson() => _$OrderDataToJson(this);
}

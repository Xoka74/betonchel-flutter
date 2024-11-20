import 'package:betonchel_manager/domain/models/order/order.dart';
import 'package:flutter/material.dart';

class OrderDetailsContent extends StatelessWidget {
  final Order order;

  const OrderDetailsContent({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return Title(
      color: Colors.white,
      title: 'Заявка № ${order.id}',
      child: Text(order.customer.name),
    );
  }
}

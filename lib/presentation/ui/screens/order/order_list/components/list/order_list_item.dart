import 'package:betonchel_manager/domain/models/order/order.dart';
import 'package:flutter/material.dart';

class OrderListItem extends StatelessWidget {
  final Order order;
  final Function(Order)? onClicked;

  const OrderListItem({
    super.key,
    required this.order,
    this.onClicked,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onClicked?.call(order),
      child: Text(
        order.description,
      ),
    );
  }
}

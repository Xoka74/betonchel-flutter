import 'package:betonchel_manager/domain/models/order/order.dart';
import 'package:flutter/material.dart';

class OrderBoardCard extends StatelessWidget {
  final Order order;
  final Function(Order)? onClicked;

  const OrderBoardCard({
    super.key,
    required this.order,
    this.onClicked,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      child: InkWell(
        onTap: () => onClicked?.call(order),
        borderRadius: BorderRadius.circular(18.0),
        child: Text('${order.id} ${order.status.name}'),
      ),
    );
  }
}

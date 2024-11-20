import 'package:betonchel_manager/domain/models/order/order.dart';
import 'package:betonchel_manager/presentation/ui/screens/order/order_list/components/list/order_list_item.dart';
import 'package:flutter/material.dart';

class OrderList extends StatelessWidget {
  final List<Order> orders;
  final Function(Order)? onClicked;

  const OrderList({
    super.key,
    required this.orders,
    this.onClicked,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: orders.length,
      itemBuilder: (context, index) {
        final order = orders[index];

        return OrderListItem(
          order: order,
          onClicked: onClicked,
        );
      },
    );
  }
}

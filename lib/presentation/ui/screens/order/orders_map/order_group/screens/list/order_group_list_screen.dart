import 'package:auto_route/auto_route.dart';
import 'package:betonchel_manager/navigation/web_router.gr.dart';
import 'package:betonchel_manager/presentation/ui/screens/order/orders_map/map/models/order_group.dart';
import 'package:flutter/material.dart';

@RoutePage()
class OrderGroupListScreen extends StatelessWidget {
  final OrderGroup orderGroup;

  const OrderGroupListScreen({
    super.key,
    required this.orderGroup,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: orderGroup.orders.length,
          itemBuilder: (context, index) {
            final order = orderGroup.orders[index];

            return TextButton(
              onPressed: () {
                // TODO: Add state management to track events in websockets
                context.router.push(
                  OrderMapDetailsPage(
                    order: order,
                  ),
                );
              },
              child: Text(order.description),
            );
          },
        ),
      ],
    );
  }
}

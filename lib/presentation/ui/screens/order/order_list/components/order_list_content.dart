import 'package:betonchel_manager/domain/models/order/order.dart';
import 'package:betonchel_manager/navigation/web_router.gr.dart';
import 'package:betonchel_manager/presentation/ui/screens/order/order_list/components/list/order_list.dart';
import 'package:betonchel_manager/utils/extensions/context_extensions.dart';
import 'package:flutter/cupertino.dart';

class OrderListContent extends StatelessWidget {
  final List<Order> orders;
  final Future<void> Function() onRefresh;
  final Function(Order)? onClicked;

  const OrderListContent({
    super.key,
    required this.orders,
    required this.onRefresh,
    this.onClicked,
  });

  @override
  Widget build(BuildContext context) {
    final strings = context.strings;

    return orders.isEmpty
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(strings.noOrders),
            ],
          )
        : OrderList(
            orders: orders,
            onClicked: onClicked,
          );
  }
}

import 'package:betonchel_manager/domain/models/order/order.dart';
import 'package:betonchel_manager/domain/models/order/order_status.dart';
import 'package:betonchel_manager/presentation/ui/screens/order/order_list/components/board/order_board_card.dart';
import 'package:betonchel_manager/utils/extensions/context_extensions.dart';
import 'package:betonchel_manager/utils/extensions/order_status_extension.dart';
import 'package:flutter/cupertino.dart';

class OrderBoard extends StatelessWidget {
  final List<Order> orders;
  final Function(Order)? onClicked;

  const OrderBoard({
    super.key,
    required this.orders,
    this.onClicked,
  });

  @override
  Widget build(BuildContext context) {
    final strings = context.strings;

    return Column(
      children: [
        ...OrderStatus.values.map(
          (e) => Expanded(
            child: Column(
              children: [
                Text(e.title(strings)),
                const SizedBox(height: 8),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => OrderBoardCard(
                      order: orders.where((element) => element.status == e).toList()[index],
                      onClicked: onClicked,
                    ),
                    itemCount: orders.where((element) => element.status == e).length,
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

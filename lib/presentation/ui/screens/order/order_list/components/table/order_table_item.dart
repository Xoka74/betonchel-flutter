import 'package:betonchel_manager/domain/models/order/order.dart';
import 'package:flutter/cupertino.dart';

class OrderTableItem extends StatelessWidget {
  final Order order;

  const OrderTableItem({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return const Text('Item');
  }
}

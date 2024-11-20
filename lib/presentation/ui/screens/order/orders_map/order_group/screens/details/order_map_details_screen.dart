import 'package:auto_route/annotations.dart';
import 'package:betonchel_manager/domain/models/order/order.dart';
import 'package:flutter/cupertino.dart';

@RoutePage()
class OrderMapDetailsScreen extends StatelessWidget {
  final Order order;

  const OrderMapDetailsScreen({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return const Text('1231312313');
  }
}

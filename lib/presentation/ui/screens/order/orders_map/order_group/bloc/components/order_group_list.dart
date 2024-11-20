import 'package:auto_route/auto_route.dart';
import 'package:betonchel_manager/presentation/ui/screens/order/orders_map/map/models/order_group.dart';
import 'package:flutter/material.dart';

class OrderGroupList extends StatelessWidget {
  final OrderGroup orderGroup;

  const OrderGroupList({
    super.key,
    required this.orderGroup,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      width: 350,
      height: 100,
      child: const Padding(
        padding: EdgeInsets.all(20),
        child: AutoRouter(),
      ),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:betonchel_manager/domain/models/order/order.dart';
import 'package:betonchel_manager/navigation/app_router.gr.dart';
import 'package:betonchel_manager/presentation/ui/components/buttons/primary_button.dart';
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
      child: Center(
        child: PrimaryButton(
          onPressed: () => context.navigateTo(EditOrderPage(id: order.id)),
          child: const Text('Edit'),
        ),
      ),
    );
  }
}

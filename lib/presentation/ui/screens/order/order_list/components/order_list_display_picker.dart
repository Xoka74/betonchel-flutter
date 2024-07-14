import 'package:auto_route/auto_route.dart';
import 'package:betonchel_manager/presentation/ui/screens/order/order_list/models/order_list_display_type.dart';
import 'package:flutter/material.dart';

@RoutePage()
class OrderListDisplayPicker extends StatelessWidget {
  const OrderListDisplayPicker({super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownButton<OrderListDisplayType>(
      items: [
        ...OrderListDisplayType.values.map(
              (e) => DropdownMenuItem(
            value: e,
            child: Text(e.name),
          ),
        ),
      ],
      // value: form.status.value,
      onChanged: (value) {
        if (value == null) {
          return;
        }

        // form.status.value = value;
      },
    );
  }
}

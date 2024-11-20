import 'package:auto_route/auto_route.dart';
import 'package:betonchel_manager/navigation/web_router.gr.dart';
import 'package:betonchel_manager/presentation/res/assets/assets.dart';
import 'package:betonchel_manager/presentation/ui/components/buttons/primary_button.dart';
import 'package:betonchel_manager/presentation/ui/components/date_pickers/date_picker_builder.dart';
import 'package:betonchel_manager/presentation/ui/screens/order/order_list/bloc/order_list_cubit.dart';
import 'package:betonchel_manager/utils/extensions/context_extensions.dart';
import 'package:betonchel_manager/utils/extensions/datetime_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderListHeader extends StatelessWidget {
  const OrderListHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = context.strings;

    return Row(
      children: [
        if (!context.screen.isMobile)
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 8),
            child: PrimaryButton(
              onPressed: () => context.router.navigate(
                CreateOrderPage(deliveryDate: context.read<OrderListCubit>().datetime.value),
              ),
              iconStart: Assets.addCircle,
              child: Text(strings.newOrder),
            ),
          ),
        const SizedBox(width: 8),
        DatePickerBuilder(
          controller: context.read<OrderListCubit>().datetime,
          builder: (DateTime? value) {
            final isToday = value?.isEqualDateWith(DateTime.now()) ?? false;

            return Row(
              children: [
                Text(isToday
                    ? 'Сегодня, ${value?.toLocaleDateFormat(strings) ?? ''}'
                    : value?.toLocaleDateFormat(strings) ?? ''),
                const SizedBox(width: 4),
                const Icon(Icons.keyboard_arrow_down_outlined),
              ],
            );
          },
        ),
        const SizedBox(width: 8),
        PrimaryButton(
          iconStart: Assets.addCircle,
          onPressed: () {
            final date = context.read<OrderListCubit>().datetime.value;

            if (date == null) {
              return;
            }

            context.router.push(OrdersMapPage(date: date));
          },
          child: Text(strings.openMap),
        )
      ],
    );
  }
}

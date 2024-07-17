import 'package:auto_route/auto_route.dart';
import 'package:betonchel_manager/navigation/web_router.gr.dart';
import 'package:betonchel_manager/presentation/res/assets/assets.dart';
import 'package:betonchel_manager/presentation/ui/components/buttons/primary_button.dart';
import 'package:betonchel_manager/presentation/ui/components/date_pickers/date_picker_builder.dart';
import 'package:betonchel_manager/presentation/ui/screens/loading/loading_screen.dart';
import 'package:betonchel_manager/presentation/ui/screens/order/order_list/bloc/order_list_cubit.dart';
import 'package:betonchel_manager/presentation/ui/screens/order/order_list/bloc/order_list_state.dart';
import 'package:betonchel_manager/presentation/ui/screens/order/order_list/components/table/order_table.dart';
import 'package:betonchel_manager/presentation/ui/screens/order/order_list/dependencies/order_list_dependencies.dart';
import 'package:betonchel_manager/utils/extensions/context_extensions.dart';
import 'package:betonchel_manager/utils/extensions/datetime_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ApplicationListScreen extends StatelessWidget implements AutoRouteWrapper {
  const ApplicationListScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) => OrderListDependencies(child: this);

  @override
  Widget build(BuildContext context) {
    final strings = context.strings;

    return BlocBuilder<OrderListCubit, OrderListState>(
      builder: (context, state) => switch (state) {
        OrderListLoadingState() => const LoadingScreen(),
        OrderListErrorState() => const Text('Error'),
        OrderListLoadedState() => Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  children: [
                    PrimaryButton(
                      onPressed: () => context.router.navigate(
                        NewOrderPage(deliveryDate: context.read<OrderListCubit>().datetime.value),
                      ),
                      iconStart: Assets.iconsAddCircle,
                      child: Text(strings.newOrder),
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
                  ],
                ),
                Expanded(
                  child: state.orders.isEmpty
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(strings.orders),
                          ],
                        )
                      : OrderTable(
                          orders: state.orders,
                          onClicked: (app) => context.router.navigate(EditOrderPage(id: app.id)),
                        ),
                ),
              ],
            ),
          ),
      },
    );
  }
}

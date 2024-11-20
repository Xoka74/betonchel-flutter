import 'package:auto_route/auto_route.dart';
import 'package:betonchel_manager/domain/models/order/order.dart';
import 'package:betonchel_manager/presentation/ui/screens/loading/loading_screen.dart';
import 'package:betonchel_manager/presentation/ui/screens/order/orders_map/map/bloc/orders_map_cubit.dart';
import 'package:betonchel_manager/presentation/ui/screens/order/orders_map/map/bloc/orders_map_state.dart';
import 'package:betonchel_manager/presentation/ui/screens/order/orders_map/map/components/orders_map_content.dart';
import 'package:betonchel_manager/presentation/ui/screens/order/orders_map/map/dependencies/orders_map_dependencies.dart';
import 'package:betonchel_manager/presentation/ui/screens/order/orders_map/map/models/order_group.dart';
import 'package:betonchel_manager/presentation/ui/screens/order/orders_map/order_group/bloc/components/order_group_list.dart';
import 'package:betonchel_manager/presentation/ui/screens/order/orders_map/order_group/screens/bottom_sheet/order_bottom_sheet.dart';
import 'package:betonchel_manager/utils/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class OrdersMapScreen extends StatefulWidget implements AutoRouteWrapper {
  final DateTime date;

  const OrdersMapScreen({
    super.key,
    required this.date,
  });

  @override
  Widget wrappedRoute(BuildContext context) => OrdersMapDependencies(date: date, child: this);

  @override
  State<OrdersMapScreen> createState() => _OrdersMapScreenState();
}

class _OrdersMapScreenState extends State<OrdersMapScreen> with SingleTickerProviderStateMixin {
  Order? _order;

  @override
  Widget build(BuildContext context) {
    final smallerThanTablet = context.smallerThanTablet;

    return Scaffold(
      body: BlocBuilder<OrdersMapCubit, OrdersMapState>(
        builder: (context, state) => switch (state) {
          OrdersMapLoadingState() => const LoadingScreen(),
          OrdersMapErrorState() => const Text('Error'),
          OrdersMapLoadedState() => Stack(
              children: [
                OrdersMapContent(
                  orders: state.orders,
                  date: widget.date,
                  onOrderClick: _onObjectClick,
                ),
                if (_order == null)
                  if (smallerThanTablet)
                    OrderBottomSheet(
                      order: _order!,
                      onCloseClick: _closeBottomSheet,
                    )
                  else
                    PositionedDirectional(
                      end: 100,
                      top: 100,
                      child: OrderGroupList(
                        orderGroup: OrderGroup(
                          latitude: 1,
                          longitude: 1,
                          orders: state.orders,
                        ),
                      ),
                    )
              ],
            ),
        },
      ),
    );
  }

  void _closeBottomSheet() => setState(() {
        _order = null;
      });

  void _onObjectClick(Order order) => setState(() {
        _order = order;
      });
}

import 'package:auto_route/auto_route.dart';
import 'package:betonchel_manager/navigation/web_router.gr.dart';
import 'package:betonchel_manager/presentation/ui/screens/loading/loading_screen.dart';
import 'package:betonchel_manager/presentation/ui/screens/order/order_list/bloc/order_list_cubit.dart';
import 'package:betonchel_manager/presentation/ui/screens/order/order_list/bloc/order_list_state.dart';
import 'package:betonchel_manager/presentation/ui/screens/order/order_list/components/order_list_content.dart';
import 'package:betonchel_manager/presentation/ui/screens/order/order_list/components/order_list_header.dart';
import 'package:betonchel_manager/presentation/ui/screens/order/order_list/dependencies/order_list_dependencies.dart';
import 'package:betonchel_manager/utils/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ApplicationListScreen extends StatelessWidget implements AutoRouteWrapper {
  const ApplicationListScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) => OrderListDependencies(child: this);

  @override
  Widget build(BuildContext context) {
    final smallerThanTablet = context.smallerThanTablet;

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: smallerThanTablet
          ? FloatingActionButton(
              onPressed: () => context.router.navigate(
                CreateOrderPage(),
              ),
              child: const Icon(Icons.add),
            )
          : null,
      body: Column(
        children: [
          const OrderListHeader(),
          Expanded(
            child: RefreshIndicator(
              onRefresh: context.read<OrderListCubit>().loadWithSelectedDate,
              child: BlocBuilder<OrderListCubit, OrderListState>(
                builder: (context, state) => switch (state) {
                  OrderListLoadingState() => const LoadingScreen(),
                  OrderListErrorState() => const Text('Error'),
                  OrderListLoadedState() => OrderListContent(
                      orders: state.orders,
                      onRefresh: context.read<OrderListCubit>().loadWithSelectedDate,
                      onClicked: (order) => context.router.navigate(
                        OrderDetailsPage(id: order.id),
                      ),
                    ),
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:betonchel_manager/presentation/ui/screens/loading/loading_screen.dart';
import 'package:betonchel_manager/presentation/ui/screens/order/order_details/bloc/order_details_cubit.dart';
import 'package:betonchel_manager/presentation/ui/screens/order/order_details/bloc/order_details_state.dart';
import 'package:betonchel_manager/presentation/ui/screens/order/order_details/components/order_details_content.dart';
import 'package:betonchel_manager/presentation/ui/screens/order/order_details/dependencies/order_details_screen_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class OrderDetailsScreen extends StatelessWidget implements AutoRouteWrapper {
  final int id;

  const OrderDetailsScreen({
    super.key,
    @pathParam required this.id,
  });

  @override
  Widget wrappedRoute(BuildContext context) => OrderDetailsScreenDependencies(
        id: id,
        child: this,
      );

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderDetailsCubit, OrderDetailsState>(
      builder: (context, state) => switch (state) {
        OrderDetailsLoadingState() => const LoadingScreen(),
        OrderDetailsLoadingFailedState() => const Text('Error'),
        OrderDetailsLoadedState() => OrderDetailsContent(
            order: state.order,
          ),
      },
    );
  }
}

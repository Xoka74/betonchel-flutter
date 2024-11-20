import 'package:betonchel_manager/di/injection.dart';
import 'package:betonchel_manager/presentation/ui/screens/order/orders_map/map/bloc/orders_map_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersMapDependencies extends StatelessWidget {
  final DateTime date;
  final Widget child;

  const OrdersMapDependencies({
    super.key,
    required this.date,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<OrdersMapCubit>(
        param1: date,
      ),
      child: child,
    );
  }
}

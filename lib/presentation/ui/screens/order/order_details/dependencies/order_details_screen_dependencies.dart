import 'package:betonchel_manager/di/injection.dart';
import 'package:betonchel_manager/presentation/ui/screens/order/order_details/bloc/order_details_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderDetailsScreenDependencies extends StatelessWidget {
  final Widget child;

  final int id;

  const OrderDetailsScreenDependencies({
    super.key,
    required this.child,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<OrderDetailsCubit>(param1: id),
      child: child,
    );
  }
}

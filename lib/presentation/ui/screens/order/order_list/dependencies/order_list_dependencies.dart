import 'package:betonchel_manager/di/injection.dart';
import 'package:betonchel_manager/presentation/ui/screens/order/order_list/bloc/order_list_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderListDependencies extends StatelessWidget {
  final Widget child;

  const OrderListDependencies({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<OrderListCubit>(),
      child: child,
    );
  }
}

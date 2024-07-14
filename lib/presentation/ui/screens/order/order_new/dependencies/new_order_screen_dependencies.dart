import 'package:betonchel_manager/di/injection.dart';
import 'package:betonchel_manager/presentation/ui/screens/order/order_new/bloc/new_order_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewOrderScreenDependencies extends StatelessWidget {
  final Widget child;
  final DateTime? deliveryDate;

  const NewOrderScreenDependencies({
    super.key,
    required this.child,
    this.deliveryDate,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<NewOrderCubit>(
        param1: deliveryDate,
      ),
      child: child,
    );
  }
}

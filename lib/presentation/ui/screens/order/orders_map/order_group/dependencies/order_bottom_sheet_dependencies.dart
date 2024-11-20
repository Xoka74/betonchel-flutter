import 'package:betonchel_manager/di/injection.dart';
import 'package:betonchel_manager/presentation/ui/screens/order/orders_map/order_group/bloc/order_bottom_sheet_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderBottomSheetDependencies extends StatelessWidget {
  final Widget child;

  const OrderBottomSheetDependencies({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<OrderBottomSheetCubit>(),
      child: child,
    );
  }
}

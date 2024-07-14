import 'package:betonchel_manager/di/injection.dart';
import 'package:betonchel_manager/presentation/ui/screens/order/application_edit/bloc/edit_order_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditOrderDependencies extends StatelessWidget {
  final int id;
  final Widget child;

  const EditOrderDependencies({
    super.key,
    required this.child,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<EditOrderCubit>(
        param1: id,
      ),
      child: child,
    );
  }
}

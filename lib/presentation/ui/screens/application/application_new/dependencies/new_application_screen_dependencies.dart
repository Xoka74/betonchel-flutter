import 'package:betonchel_manager/di/injection.dart';
import 'package:betonchel_manager/presentation/ui/screens/application/application_new/bloc/new_application_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewApplicationScreenDependencies extends StatelessWidget {
  final Widget child;
  final DateTime? deliveryDate;

  const NewApplicationScreenDependencies({
    super.key,
    required this.child,
    this.deliveryDate,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<NewApplicationCubit>(
        param1: deliveryDate,
      ),
      child: child,
    );
  }
}

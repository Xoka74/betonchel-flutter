import 'package:betonchel_manager/di/injection.dart';
import 'package:betonchel_manager/presentation/ui/screens/application/application_edit/bloc/edit_application_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditApplicationDependencies extends StatelessWidget {
  final int id;
  final Widget child;

  const EditApplicationDependencies({
    super.key,
    required this.child,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<EditApplicationCubit>(
        param1: id,
      ),
      child: child,
    );
  }
}

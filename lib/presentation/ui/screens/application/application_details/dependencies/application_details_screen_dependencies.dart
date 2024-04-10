import 'package:betonchel_manager/di/injection.dart';
import 'package:betonchel_manager/presentation/ui/screens/application/application_details/bloc/application_details_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApplicationDetailsScreenDependencies extends StatelessWidget {
  final Widget child;

  final int id;

  const ApplicationDetailsScreenDependencies({
    super.key,
    required this.child,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<ApplicationDetailsCubit>(param1: id),
      child: child,
    );
  }
}

import 'package:betonchel_manager/di/injection.dart';
import 'package:betonchel_manager/presentation/ui/screens/locations/bloc/location_search_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocationSearchDependencies extends StatelessWidget {
  final Widget child;

  const LocationSearchDependencies({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<LocationSearchCubit>(),
      child: child,
    );
  }
}

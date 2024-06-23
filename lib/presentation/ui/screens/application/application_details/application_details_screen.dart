import 'package:auto_route/auto_route.dart';
import 'package:betonchel_manager/presentation/ui/screens/application/application_details/bloc/application_details_cubit.dart';
import 'package:betonchel_manager/presentation/ui/screens/application/application_details/bloc/application_details_state.dart';
import 'package:betonchel_manager/presentation/ui/screens/application/application_details/components/application_details_content.dart';
import 'package:betonchel_manager/presentation/ui/screens/application/application_details/dependencies/application_details_screen_dependencies.dart';
import 'package:betonchel_manager/presentation/ui/screens/loading/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ApplicationDetailsScreen extends StatelessWidget implements AutoRouteWrapper {
  final int id;

  const ApplicationDetailsScreen({
    super.key,
    @pathParam required this.id,
  });

  @override
  Widget wrappedRoute(BuildContext context) => ApplicationDetailsScreenDependencies(
        id: id,
        child: this,
      );

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApplicationDetailsCubit, ApplicationDetailsState>(
      builder: (context, state) => switch (state) {
        ApplicationDetailsLoadingState() => const LoadingScreen(),
        ApplicationDetailsLoadingFailedState() => const Text('Error'),
        ApplicationDetailsLoadedState() => ApplicationDetailsContent(
            application: state.application,
          ),
      },
    );
  }
}

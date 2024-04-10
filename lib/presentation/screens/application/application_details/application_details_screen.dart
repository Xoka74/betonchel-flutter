import 'package:auto_route/auto_route.dart';
import 'package:betonchel_manager/presentation/components/layouts/default_screen_layout.dart';
import 'package:betonchel_manager/presentation/screens/application/application_details/bloc/application_details_cubit.dart';
import 'package:betonchel_manager/presentation/screens/application/application_details/bloc/application_details_state.dart';
import 'package:betonchel_manager/presentation/screens/application/application_details/dependencies/application_details_screen_dependencies.dart';
import 'package:betonchel_manager/presentation/screens/loading/loading_screen.dart';
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
      builder: (context, state) => DefaultScreenLayout(
        appBar: AppBar(
          title: Text(state is ApplicationDetailsLoadedState ? state.application.id.toString() : ''),
          leading: IconButton(
            onPressed: context.router.maybePop,
            icon: const Icon(Icons.arrow_back_ios_new),
          ),
        ),
        child: switch (state) {
          ApplicationDetailsLoadingState() => const LoadingScreen(),
          ApplicationDetailsLoadedState() => Center(child: Text(state.application.id.toString())),
          ApplicationDetailsLoadingFailedState() => const Text('Error'),
        },
      ),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:betonchel_manager/domain/models/location/location.dart';
import 'package:betonchel_manager/presentation/ui/components/text_fields/app_text_field.dart';
import 'package:betonchel_manager/presentation/ui/screens/loading/loading_screen.dart';
import 'package:betonchel_manager/presentation/ui/screens/locations/bloc/location_search_cubit.dart';
import 'package:betonchel_manager/presentation/ui/screens/locations/bloc/location_search_state.dart';
import 'package:betonchel_manager/presentation/ui/screens/locations/components/location_search_content.dart';
import 'package:betonchel_manager/presentation/ui/screens/locations/dependencies/location_search_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage<Location?>()
class LocationSearchScreen extends StatelessWidget implements AutoRouteWrapper {
  const LocationSearchScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) => LocationSearchDependencies(child: this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: AppTextField(
              controller: context.read<LocationSearchCubit>().controller,
            ),
          ),
          Expanded(
            child: BlocBuilder<LocationSearchCubit, LocationSearchState>(
              builder: (context, state) => switch (state) {
                LocationSearchLoadingState() => const LoadingScreen(),
                LocationSearchErrorState() => const Text('Error'),
                LocationSearchSuccessState() => switch (state.locations.length) {
                    0 => const Center(
                        child: Text('Нет результатов'),
                      ),
                    _ => LocationSearchContent(
                        locations: state.locations,
                        onClick: context.maybePop,
                      ),
                  }
              },
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:betonchel_manager/domain/models/application/application_status.dart';
import 'package:betonchel_manager/navigation/app_router.gr.dart';
import 'package:betonchel_manager/presentation/components/app_bar/actions/notifications_action.dart';
import 'package:betonchel_manager/presentation/components/app_bar/actions/profile_action.dart';
import 'package:betonchel_manager/presentation/components/date_pickers/date_picker_builder.dart';
import 'package:betonchel_manager/presentation/components/layouts/default_screen_layout.dart';
import 'package:betonchel_manager/presentation/screens/home/bloc/home_cubit.dart';
import 'package:betonchel_manager/presentation/screens/home/bloc/home_state.dart';
import 'package:betonchel_manager/presentation/screens/home/components/application_item.dart';
import 'package:betonchel_manager/presentation/screens/home/dependencies/home_screen_dependencies.dart';
import 'package:betonchel_manager/presentation/screens/loading/loading_screen.dart';
import 'package:betonchel_manager/utils/extensions/application_status_extension.dart';
import 'package:betonchel_manager/utils/extensions/context_extensions.dart';
import 'package:betonchel_manager/utils/extensions/datetime_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HomeScreen extends StatelessWidget implements AutoRouteWrapper {
  const HomeScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) => HomeScreenDependencies(child: this);

  @override
  Widget build(BuildContext context) {
    final strings = context.strings;

    return DefaultScreenLayout(
      floatingActionButton: IconButton(
        onPressed: () => context.router.push(
          NewApplicationPage(deliveryDate: context.read<HomeCubit>().datetimeController.value),
        ),
        icon: const Icon(Icons.add),
      ),
      appBar: AppBar(
        actions: const [
          ProfileAction(),
          NotificationsAction(),
        ],
        centerTitle: false,
        title: DatePickerBuilder(
          controller: context.read<HomeCubit>().datetimeController,
          builder: (DateTime? value) => Row(
            children: [
              Text(value?.toLocaleDateFormat(strings) ?? ''),
              const SizedBox(width: 4),
              const Icon(Icons.keyboard_arrow_down_outlined),
            ],
          ),
        ),
      ),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) => switch (state) {
          HomeLoadingState() => const LoadingScreen(),
          HomeLoadingErrorState() => const Text('Error'),
          HomeLoadedState() => Padding(
              padding: const EdgeInsets.all(20),
              child: state.applications.isEmpty
                  ? Center(
                      child: Column(
                        children: [
                          Text(strings.noApplications),
                          IconButton(
                            onPressed: () => context.router.push(
                              NewApplicationPage(
                                deliveryDate: context.read<HomeCubit>().datetimeController.value,
                              ),
                            ),
                            icon: const Icon(Icons.add),
                          ),
                        ],
                      ),
                    )
                  : Column(
                      children: [
                        ...ApplicationStatus.values.map(
                          (e) => Expanded(
                            child: Column(
                              children: [
                                Text(e.title(context.strings)),
                                const SizedBox(height: 8),
                                Expanded(
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) => ApplicationItem(
                                      application:
                                          state.applications.where((element) => element.status == e).toList()[index],
                                      onClicked: (application) =>
                                          context.router.push(ApplicationDetailsPage(id: application.id)),
                                    ),
                                    itemCount: state.applications.where((element) => element.status == e).length,
                                  ),
                                ),
                                const SizedBox(height: 8),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
        },
      ),
    );
  }
}

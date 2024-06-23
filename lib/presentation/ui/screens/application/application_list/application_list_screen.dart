import 'package:auto_route/auto_route.dart';
import 'package:betonchel_manager/navigation/app_router.gr.dart';
import 'package:betonchel_manager/presentation/res/assets/assets.dart';
import 'package:betonchel_manager/presentation/ui/components/buttons/primary_button.dart';
import 'package:betonchel_manager/presentation/ui/components/date_pickers/date_picker_builder.dart';
import 'package:betonchel_manager/presentation/ui/screens/application/application_list/bloc/application_list_cubit.dart';
import 'package:betonchel_manager/presentation/ui/screens/application/application_list/bloc/application_list_state.dart';
import 'package:betonchel_manager/presentation/ui/screens/application/application_list/components/table/application_table.dart';
import 'package:betonchel_manager/presentation/ui/screens/application/application_list/dependencies/application_list_dependencies.dart';
import 'package:betonchel_manager/presentation/ui/screens/loading/loading_screen.dart';
import 'package:betonchel_manager/utils/extensions/context_extensions.dart';
import 'package:betonchel_manager/utils/extensions/datetime_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ApplicationListScreen extends StatelessWidget implements AutoRouteWrapper {
  const ApplicationListScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) => ApplicationListDependencies(child: this);

  @override
  Widget build(BuildContext context) {
    final strings = context.strings;

    return BlocBuilder<ApplicationListCubit, ApplicationListState>(
      builder: (context, state) => switch (state) {
        ApplicationListLoadingState() => const LoadingScreen(),
        ApplicationListErrorState() => const Text('Error'),
        ApplicationListLoadedState() => Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  children: [
                    PrimaryButton(
                      onPressed: () => context.router.navigate(
                        NewApplicationPage(deliveryDate: context.read<ApplicationListCubit>().datetime.value),
                      ),
                      iconStart: Assets.iconsAddCircle,
                      child: Text(strings.newApplication),
                    ),
                    const SizedBox(width: 8),
                    DatePickerBuilder(
                      controller: context.read<ApplicationListCubit>().datetime,
                      builder: (DateTime? value) {
                        final isToday = value?.isEqualDateWith(DateTime.now()) ?? false;

                        return Row(
                          children: [
                            Text(isToday
                                ? 'Сегодня, ${value?.toLocaleDateFormat(strings) ?? ''}'
                                : value?.toLocaleDateFormat(strings) ?? ''),
                            const SizedBox(width: 4),
                            const Icon(Icons.keyboard_arrow_down_outlined),
                          ],
                        );
                      },
                    ),
                  ],
                ),
                Expanded(
                  child: state.applications.isEmpty
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(strings.noApplications),
                          ],
                        )
                      : ApplicationTable(
                          applications: state.applications,
                          onApplicationClicked: (app) => context.router.navigate(EditApplicationPage(id: app.id)),
                        ),
                ),
              ],
            ),
          ),
      },
    );
  }
}

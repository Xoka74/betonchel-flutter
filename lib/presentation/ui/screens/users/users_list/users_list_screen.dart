import 'package:auto_route/auto_route.dart';
import 'package:betonchel_manager/presentation/ui/screens/loading/loading_screen.dart';
import 'package:betonchel_manager/presentation/ui/screens/users/users_list/bloc/users_list_cubit.dart';
import 'package:betonchel_manager/presentation/ui/screens/users/users_list/bloc/users_list_state.dart';
import 'package:betonchel_manager/presentation/ui/screens/users/users_list/components/users_list_content.dart';
import 'package:betonchel_manager/presentation/ui/screens/users/users_list/dependencies/users_list_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class UsersListScreen extends StatelessWidget implements AutoRouteWrapper {
  const UsersListScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) => UsersListDependencies(child: this);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: BlocBuilder<UsersListCubit, UsersListState>(
        builder: (context, state) => switch (state) {
          UsersListLoadingState() => const LoadingScreen(),
          UsersListErrorState() => const Text('Error'),
          UsersListLoadedState() => UsersListContent(users: state.users),
        },
      ),
    );
  }
}

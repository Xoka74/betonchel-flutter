import 'package:auto_route/auto_route.dart';
import 'package:betonchel_manager/navigation/web_router.gr.dart';
import 'package:betonchel_manager/presentation/ui/screens/concrete_grade/concrete_grade_list/bloc/concrete_grade_list_cubit.dart';
import 'package:betonchel_manager/presentation/ui/screens/concrete_grade/concrete_grade_list/bloc/concrete_grade_list_state.dart';
import 'package:betonchel_manager/presentation/ui/screens/concrete_grade/concrete_grade_list/components/concrete_grade_list_content.dart';
import 'package:betonchel_manager/presentation/ui/screens/concrete_grade/concrete_grade_list/dependencies/concrete_grade_list_dependencies.dart';
import 'package:betonchel_manager/presentation/ui/screens/loading/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ConcreteGradeListScreen extends StatelessWidget implements AutoRouteWrapper {
  const ConcreteGradeListScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) => ConcreteGradeListDependencies(child: this);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConcreteGradeListCubit, ConcreteGradeListState>(
      builder: (context, state) => switch (state) {
        ConcreteGradeListLoadingState() => const LoadingScreen(),
        ConcreteGradeListErrorState() => ErrorWidget(state.error),
        ConcreteGradeListLoadedState() => ConcreteGradeListContent(
            concreteGrades: state.concreteGrades,
            onConcreteGradeClicked: (grade) => context.router.push(
              ConcreteGradeEditPage(id: grade.id),
            ),
          ),
      },
    );
  }
}

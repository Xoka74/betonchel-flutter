import 'package:betonchel_manager/domain/models/application/application.dart';

sealed class HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {
  final List<Application> applications;

  HomeLoadedState(this.applications);
}

class HomeLoadingErrorState extends HomeState {}

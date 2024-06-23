import 'package:betonchel_manager/domain/models/application/application.dart';

sealed class ApplicationListState {}

class ApplicationListLoadingState extends ApplicationListState {}

class ApplicationListLoadedState extends ApplicationListState {
  final List<Application> applications;

  ApplicationListLoadedState(this.applications);
}

class ApplicationListErrorState extends ApplicationListState {}

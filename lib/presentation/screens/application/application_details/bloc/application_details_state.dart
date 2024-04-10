import 'package:betonchel_manager/domain/models/application/application.dart';

sealed class ApplicationDetailsState {}

class ApplicationDetailsLoadingState extends ApplicationDetailsState {}

class ApplicationDetailsLoadedState extends ApplicationDetailsState {
  final Application application;

  ApplicationDetailsLoadedState(this.application);
}

class ApplicationDetailsLoadingFailedState extends ApplicationDetailsState {}

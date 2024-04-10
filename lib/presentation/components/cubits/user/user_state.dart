import 'package:betonchel_manager/domain/models/user/user.dart';

sealed class UserState {}

final class UserLoadingState extends UserState {}

final class UserLoadedState extends UserState {
  final User user;

  UserLoadedState(this.user);
}

final class UserErrorState extends UserState {}

import 'package:betonchel_manager/domain/models/user/user.dart';

sealed class UsersListState {}

class UsersListLoadingState extends UsersListState {}

class UsersListLoadedState extends UsersListState {
  final List<User> users;

  UsersListLoadedState(this.users);
}

class UsersListErrorState extends UsersListState {}

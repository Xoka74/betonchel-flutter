import 'package:betonchel_manager/domain/models/user/user.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@singleton
class UserDataSource {
  final _user = BehaviorSubject<User>();

  Stream<User> get user => _user.stream;

  void set(User user) {
    _user.sink.add(user);
  }
}

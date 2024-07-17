import 'package:betonchel_manager/domain/models/user/user.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@singleton
class UserDataSource {
  final _user = BehaviorSubject<User?>();

  User? get user => _user.valueOrNull;

  ValueStream<User?> get userStream => _user.stream;

  void set(User user) => _user.sink.add(user);

  void clear() => _user.add(null);
}

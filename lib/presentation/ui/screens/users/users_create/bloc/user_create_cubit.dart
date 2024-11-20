import 'package:betonchel_manager/domain/repositories/users_repository.dart';
import 'package:betonchel_manager/presentation/ui/components/cubits/form_screen/form_screen_cubit.dart';
import 'package:betonchel_manager/presentation/ui/components/cubits/form_screen/form_screen_state.dart';
import 'package:betonchel_manager/presentation/ui/screens/users/shared/models/user_form.dart';
import 'package:injectable/injectable.dart';

@injectable
class UserCreateCubit extends FormScreenCubit<UserForm> {
  final UsersRepository _usersRepository;

  UserCreateCubit(this._usersRepository) : super(UserForm());

  @override
  Future<void> sendForm() async {
    emit(FormSubmittingState(form));

    final data = form.getData();

    try {
      await _usersRepository.createUser(data);
      emit(FormSubmittedState(form));
    } catch (err) {
      emit(FormSubmissionFailedState(form));
    }
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';

abstract class InitializableCubit<TState> extends Cubit<TState> {
  InitializableCubit(super.initialState) {
    initialize();
  }

  void initialize();
}

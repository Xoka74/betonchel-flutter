import 'package:bloc/bloc.dart';

class OrderBottomSheetCubit extends Cubit<int> {
  final int _id;

  OrderBottomSheetCubit(
    this._id,
  ) : super(1);
}

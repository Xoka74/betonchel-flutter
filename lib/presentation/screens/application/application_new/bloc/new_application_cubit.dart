import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class NewApplicationCubit extends Cubit<bool> {
  DateTime? initialDeliveryDate;

  NewApplicationCubit(
    @factoryParam DateTime? initialDeliveryDate,
  ) : super(true);
}

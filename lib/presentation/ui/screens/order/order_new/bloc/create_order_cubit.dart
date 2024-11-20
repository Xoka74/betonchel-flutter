import 'package:betonchel_manager/common/error_handler.dart';
import 'package:betonchel_manager/domain/repositories/concrete_grades_repository.dart';
import 'package:betonchel_manager/domain/repositories/orders_repository.dart';
import 'package:betonchel_manager/presentation/ui/components/cubits/form_screen/form_screen_cubit.dart';
import 'package:betonchel_manager/presentation/ui/components/cubits/form_screen/form_screen_state.dart';
import 'package:betonchel_manager/presentation/ui/screens/order/shared/models/order_form.dart';
import 'package:injectable/injectable.dart';

@injectable
class CreateOrderCubit extends FormScreenCubit<OrderForm> {
  final OrdersRepository _applicationsRepository;
  final ConcreteGradesRepository _concreteGradesRepository;
  final ErrorHandler _errorHandler;
  final DateTime? _initialDeliveryDate;

  CreateOrderCubit(
    @factoryParam this._initialDeliveryDate,
    this._applicationsRepository,
    this._concreteGradesRepository,
    this._errorHandler,
  ) : super(OrderForm());

  @override
  Future<void> prepareData() async {
    try {
      form.deliveryDateTime.value = _initialDeliveryDate ?? DateTime.now();
      final concreteGrades = await _concreteGradesRepository.getConcreteGrades();

      form.allConcreteGrades.value = concreteGrades;

      emit(FormEditingState(form));
    } catch (e) {
      emit(FormPreparationFailedState(form));
    }
  }

  @override
  Future<void> sendForm() async {
    final data = form.getOrderData();

    try {
      await _applicationsRepository.createOrder(data);
      emit(FormSubmittedState(form));
    } catch (e) {

      _errorHandler.handleError(e);
      emit(FormSubmissionFailedState(form));
    }
  }
}

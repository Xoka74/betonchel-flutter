import 'package:betonchel_manager/domain/repositories/orders_repository.dart';
import 'package:betonchel_manager/domain/repositories/concrete_grades_repository.dart';
import 'package:betonchel_manager/presentation/ui/components/cubits/form_screen/form_screen_cubit.dart';
import 'package:betonchel_manager/presentation/ui/components/cubits/form_screen/form_screen_state.dart';
import 'package:betonchel_manager/presentation/ui/screens/order/shared/models/order_form.dart';
import 'package:injectable/injectable.dart';

@injectable
class EditOrderCubit extends FormScreenCubit<OrderForm> {
  final OrdersRepository _ordersRepository;
  final ConcreteGradesRepository _concreteGradesRepository;
  final int id;

  EditOrderCubit(
    @factoryParam this.id,
    this._ordersRepository,
    this._concreteGradesRepository,
  ) : super(OrderForm());

  @override
  Future<void> prepareData() async {
    emit(FormPreparationState(form));

    try {
      final order = await _ordersRepository.getOrderById(id);
      final concreteGrades = await _concreteGradesRepository.getConcreteGrades();
      form.allConcreteGrades.value = concreteGrades;

      form.setData(order);
      emit(FormEditingState(form));
    } catch (err) {
      emit(FormPreparationFailedState(form));
    }
  }

  @override
  Future<void> sendForm() async {
    final data = form.getOrderData();

    emit(FormSubmittingState(form));

    try {
      await _ordersRepository.editOrder(id, data);
      emit(FormSubmittedState(form));
    } catch (err) {
      emit(FormSubmissionFailedState(form));
    }
  }
}

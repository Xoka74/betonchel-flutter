import 'package:betonchel_manager/domain/models/application/application.dart';
import 'package:betonchel_manager/domain/models/application/application_status.dart';
import 'package:betonchel_manager/domain/models/application/create_application_data.dart';
import 'package:betonchel_manager/domain/models/user/user.dart';
import 'package:betonchel_manager/domain/models/user/user_role.dart';
import 'package:betonchel_manager/domain/repositories/applications_repository.dart';
import 'package:betonchel_manager/utils/extensions/datetime_extensions.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ApplicationsRepository)
class ApplicationsRepositoryFakeImpl implements ApplicationsRepository {
  final applications = List.generate(
    50,
    (index) => Application(
      id: 1,
      creator: const User(
        id: '1',
        email: 'email',
        username: 'username',
        userRole: UserRole.manager,
      ),
      customerName: '',
      totalPrice: 100,
      volume: 100.1,
      deliveryAddress: '',
      creationDate: DateTime.now().add(Duration(days: index % 5)),
      deliveryDate: DateTime.now().add(Duration(days: index % 5)),
      concretePump: null,
      concreteGrade: null,
      status: ApplicationStatus.values[index % 5],
    ),
  );

  @override
  Future<void> createApplication(CreateApplicationData data) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteApplication(int id) async => applications.removeWhere((element) => element.id == id);

  @override
  Future<Application> getApplicationById(int id) async {
    await Future.delayed(const Duration(seconds: 1));

    return applications.firstWhere((element) => element.id == id);
  }

  @override
  Future<List<Application>> getApplications(DateTime date) async {
    await Future.delayed(const Duration(seconds: 1));

    return applications.where((element) => element.deliveryDate.isTheSameDateWith(date)).toList();
  }
}

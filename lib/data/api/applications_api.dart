import 'package:betonchel_manager/di/constants/injection_keys.dart';
import 'package:betonchel_manager/domain/models/application/application.dart';
import 'package:betonchel_manager/domain/models/application/application_data.dart';
import 'package:betonchel_manager/domain/models/error/operation_status.dart';
import 'package:betonchel_manager/domain/models/filters/application_filters.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'applications_api.g.dart';

@RestApi()
@injectable
abstract class ApplicationsApi {
  @factoryMethod
  factory ApplicationsApi(@Named(InjectionKeys.appDio) Dio dio) = _ApplicationsApi;

  @GET('applications')
  Future<List<Application>> getApplications(@Queries() ApplicationFilters filters);

  @GET('applications/{id}')
  Future<Application> getApplicationById(@Path() int id);

  @POST('applications/create')
  Future<OperationStatus> createApplication(@Body() ApplicationData data);

  @PUT('applications/edit/{id}')
  Future<OperationStatus> editApplication(@Path() int id, @Body() ApplicationData data);

  @DELETE('applications/{id}')
  Future<OperationStatus> deleteApplication(@Path() int id);
}

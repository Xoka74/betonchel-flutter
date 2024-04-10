import 'package:betonchel_manager/domain/models/application/application.dart';
import 'package:betonchel_manager/domain/models/application/create_application_data.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'applications_api.g.dart';

@RestApi()
@injectable
abstract class ApplicationsApi {
  @factoryMethod
  factory ApplicationsApi(Dio dio) = _ApplicationsApi;

  @GET('applications')
  Future<List<Application>> getApplications(@Field('delivery_date') DateTime deliveryDate);

  @POST('applications/new')
  Future<void> createApplication(@Body() CreateApplicationData data);

  @GET('applications/{id}')
  Future<Application> getApplicationById(@Path() int id);

  @DELETE('applications/{id}')
  Future<void> deleteApplication(@Path() int id);
}

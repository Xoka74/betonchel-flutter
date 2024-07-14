import 'package:betonchel_manager/domain/models/concrete/concrete_grade.dart';
import 'package:betonchel_manager/domain/models/concrete/concrete_grade_data.dart';
import 'package:betonchel_manager/domain/models/error/operation_status.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'concrete_grades_api.g.dart';

@RestApi()
@injectable
abstract class ConcreteGradesApi {
  @factoryMethod
  factory ConcreteGradesApi(Dio dio) = _ConcreteGradesApi;

  @GET('concrete_grades')
  Future<List<ConcreteGrade>> getConcreteGrades();

  @GET('concrete_grades/{id}')
  Future<ConcreteGrade> getById(@Path() int id);

  @POST('concrete_grades/create')
  Future<OperationStatus> createConcreteGrade(@Body() ConcreteGradeData data);

  @PUT('concrete_grades/edit/{id}')
  Future<OperationStatus> updateConcreteGrade(@Path() int id, @Body() ConcreteGradeData data);

  @DELETE('concrete_grades/delete/{id}')
  Future<OperationStatus> deleteConcreteGrade(@Path() int id);
}

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'concrete_grades_api.g.dart';

@RestApi()
@injectable
abstract class ConcreteGradesApi {
  @factoryMethod
  factory ConcreteGradesApi(Dio dio) = _ConcreteGradesApi;
}

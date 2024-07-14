import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@injectable
class LoggingInterceptor extends Interceptor {
  final Logger logger;

  LoggingInterceptor(this.logger);

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    logger.e(
      'DioException: \n'
      'statusCode: ${err.response?.statusCode}\n'
      'url: ${err.requestOptions.uri}\n'
      'requestBody: ${err.requestOptions.data}\n'
      'responseBody: ${err.response?.data}',
      error: err,
      stackTrace: err.stackTrace,
    );

    handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    logger.i(
      'OnRequest: \n'
      'url: ${options.uri}\n'
      'requestBody: ${options.data}\n'
      'headers: ${options.headers}\n'
      'queryParameters: ${options.queryParameters}',
      stackTrace: StackTrace.empty,
    );

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logger.i(
      'OnResponse: \n'
      'url: ${response.requestOptions.uri}\n'
      '$response',
      stackTrace: StackTrace.empty,
    );
    return handler.next(response);
  }
}

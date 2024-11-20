import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@lazySingleton
class ErrorHandler {
  final Logger _logger;

  ErrorHandler(this._logger);

  void handleError(
    Object error, {
    StackTrace? stackTrace,
  }) {
    _logger.e(error, stackTrace: stackTrace);
  }
}

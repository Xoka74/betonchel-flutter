import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@module
abstract class CommonModule {
  @lazySingleton
  Logger get logger => Logger(
        printer: PrettyPrinter(
          methodCount: 2,
          errorMethodCount: 8,
          lineLength: 120,
          printTime: true,
          colors: false,
          printEmojis: false,
        ),
      );
}

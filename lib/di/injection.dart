import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'package:betonchel_manager/di/injection.config.dart';

final locator = GetIt.instance;

@injectableInit
void configureDependencies() => locator.init();

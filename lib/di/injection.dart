import 'package:betonchel_manager/di/injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final locator = GetIt.instance;

const dev = Environment('dev');
const prod = Environment('prod');

@injectableInit
void configureDependencies() => locator.init(environment: prod.name);

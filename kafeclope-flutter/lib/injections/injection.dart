import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:kafeclope/services/auth.service.dart';

import 'injection.config.dart';

final injector = GetIt.instance;

@InjectableInit()
Future<GetIt> configureDependencies() async {
  final GetIt instance = await injector.init();

  return instance;
}

import 'package:flutter/material.dart';
import 'package:kafeclope/config/app_router.dart';
import 'package:kafeclope/injections/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();
  runApp(App());
}

class App extends StatelessWidget {
  App({super.key});
  final _appRouter = injector<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      theme: ThemeData(primarySwatch: Colors.brown),
      debugShowCheckedModeBanner: false,
    );
  }
}

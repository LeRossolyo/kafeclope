import 'package:flutter/material.dart';
import 'package:kafeclope/config/app_router.dart';
import 'package:kafeclope/config/themes/app.theme.dart';
import 'package:kafeclope/injections/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();
  runApp(App());
}

class App extends StatelessWidget {
  App({super.key});
  final _appRouter = injector<AppRouter>();
  final _appThemes = AppTheme();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      theme: _appThemes.light,
      darkTheme: _appThemes.dark,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
    );
  }
}

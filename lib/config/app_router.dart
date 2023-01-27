import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kafeclope/config/auth.guard.dart';
import 'package:kafeclope/views/pages/auth.page.dart';
import 'package:kafeclope/views/pages/home.page.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomePage, path: 'home', initial: true, guards: [AuthGuard]),
    AutoRoute(page: AuthPage, path: 'auth', initial: true),
  ],
)
class AppRouter extends _$AppRouter {
  AppRouter({required AuthGuard authGuard}) : super(authGuard: authGuard);
}
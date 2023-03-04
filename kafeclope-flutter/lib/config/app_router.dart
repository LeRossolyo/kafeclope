import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kafeclope/views/pages/auth/auth.page.dart';
import 'package:kafeclope/views/pages/auth/login.page.dart';
import 'package:kafeclope/views/pages/auth/register.page.dart';
import 'package:kafeclope/views/pages/auth/register.picture.page.dart';
import 'package:kafeclope/views/pages/friends.page.dart';
import 'package:kafeclope/views/pages/historic.page.dart';
import 'package:kafeclope/views/pages/home.page.dart';
import 'package:kafeclope/views/pages/room.page.dart';
import 'package:kafeclope/views/pages/user.infos.page.dart';
import 'package:kafeclope/views/pages/user.page.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: HomePage,
      path: 'home',
    ),
    AutoRoute(
        page: AuthPage,
        path: 'auth',
        initial: true,
        children: <AutoRoute>[
          AutoRoute(page: RegisterPage, path: 'register'),
          AutoRoute(page: RegisterPicturePage, path: 'picture', initial: true),
          AutoRoute(
            page: LoginPage,
            path: 'login',
          ),
        ]),
    AutoRoute(page: UserInfoPage, path: 'user_info'),
    AutoRoute(page: UserPage, path: 'user'),
    AutoRoute(page: FriendsPage, path: 'firends'),
    AutoRoute(page: RoomPage, path: 'room'),
    AutoRoute(page: HistoricPage, path: 'historic'),
  ],
)
class AppRouter extends _$AppRouter {}
// {
//   AppRouter({required AuthGuard authGuard}) : super(authGuard: authGuard);
// }

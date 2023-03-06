// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    AuthRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const AuthPage(),
      );
    },
    UserRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const UserPage(),
      );
    },
    FriendsRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const FriendsPage(),
      );
    },
    RoomRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const RoomPage(),
      );
    },
    HistoricRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const HistoricPage(),
      );
    },
    RegisterRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const RegisterPage(),
      );
    },
    RegisterPictureRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const RegisterPicturePage(),
      );
    },
    LoginRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const LoginPage(),
      );
    },
    UserInfoRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const UserInfoPage(),
      );
    },
    UserHomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const UserHomePage(),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: 'home',
          fullMatch: true,
        ),
        RouteConfig(
          HomeRoute.name,
          path: 'home',
        ),
        RouteConfig(
          AuthRoute.name,
          path: 'auth',
          children: [
            RouteConfig(
              RegisterRoute.name,
              path: 'register',
              parent: AuthRoute.name,
            ),
            RouteConfig(
              RegisterPictureRoute.name,
              path: 'picture',
              parent: AuthRoute.name,
            ),
            RouteConfig(
              LoginRoute.name,
              path: 'login',
              parent: AuthRoute.name,
            ),
          ],
        ),
        RouteConfig(
          UserRoute.name,
          path: 'user',
          children: [
            RouteConfig(
              UserInfoRoute.name,
              path: 'info',
              parent: UserRoute.name,
            ),
            RouteConfig(
              UserHomeRoute.name,
              path: 'home',
              parent: UserRoute.name,
            ),
          ],
        ),
        RouteConfig(
          FriendsRoute.name,
          path: 'firends',
        ),
        RouteConfig(
          RoomRoute.name,
          path: 'room',
        ),
        RouteConfig(
          HistoricRoute.name,
          path: 'historic',
        ),
      ];
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: 'home',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [AuthPage]
class AuthRoute extends PageRouteInfo<void> {
  const AuthRoute({List<PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          path: 'auth',
          initialChildren: children,
        );

  static const String name = 'AuthRoute';
}

/// generated route for
/// [UserPage]
class UserRoute extends PageRouteInfo<void> {
  const UserRoute({List<PageRouteInfo>? children})
      : super(
          UserRoute.name,
          path: 'user',
          initialChildren: children,
        );

  static const String name = 'UserRoute';
}

/// generated route for
/// [FriendsPage]
class FriendsRoute extends PageRouteInfo<void> {
  const FriendsRoute()
      : super(
          FriendsRoute.name,
          path: 'firends',
        );

  static const String name = 'FriendsRoute';
}

/// generated route for
/// [RoomPage]
class RoomRoute extends PageRouteInfo<void> {
  const RoomRoute()
      : super(
          RoomRoute.name,
          path: 'room',
        );

  static const String name = 'RoomRoute';
}

/// generated route for
/// [HistoricPage]
class HistoricRoute extends PageRouteInfo<void> {
  const HistoricRoute()
      : super(
          HistoricRoute.name,
          path: 'historic',
        );

  static const String name = 'HistoricRoute';
}

/// generated route for
/// [RegisterPage]
class RegisterRoute extends PageRouteInfo<void> {
  const RegisterRoute()
      : super(
          RegisterRoute.name,
          path: 'register',
        );

  static const String name = 'RegisterRoute';
}

/// generated route for
/// [RegisterPicturePage]
class RegisterPictureRoute extends PageRouteInfo<void> {
  const RegisterPictureRoute()
      : super(
          RegisterPictureRoute.name,
          path: 'picture',
        );

  static const String name = 'RegisterPictureRoute';
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: 'login',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [UserInfoPage]
class UserInfoRoute extends PageRouteInfo<void> {
  const UserInfoRoute()
      : super(
          UserInfoRoute.name,
          path: 'info',
        );

  static const String name = 'UserInfoRoute';
}

/// generated route for
/// [UserHomePage]
class UserHomeRoute extends PageRouteInfo<void> {
  const UserHomeRoute()
      : super(
          UserHomeRoute.name,
          path: 'home',
        );

  static const String name = 'UserHomeRoute';
}

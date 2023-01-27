import 'package:auto_route/auto_route.dart';
import 'package:kafeclope/services/auth.service.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    print('Auth Guard');
    if (true) {
      resolver.next(true);
    }
    // } else  {
    //   router.navigateNamed('auth');
    // }
  }
}

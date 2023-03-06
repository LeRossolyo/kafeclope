import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class UserVM extends ChangeNotifier {
  final StackRouter _router;

  UserVM(
    this._router,
  ) : super();

  factory UserVM.init(BuildContext context) {
    return UserVM(AutoRouter.of(context));
  }

  redirectTo(String path) {
    _router.navigateNamed(path);
  }

  disconnect() {
    print('Disconnect user');
    redirectTo('auth/login');
  }
}

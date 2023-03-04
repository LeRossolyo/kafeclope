import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class DrawerViewModel extends ChangeNotifier {
  final StackRouter _router;
  List<int> selected = [];

  DrawerViewModel(
    this._router,
  ) : super();

  factory DrawerViewModel.init(BuildContext context) {
    return DrawerViewModel(AutoRouter.of(context));
  }

  redirectTo(String path) {
    _router.navigateNamed(path);
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class HomeVM extends ChangeNotifier {
  StackRouter _router;
  List<int> selected = [];

  HomeVM(this._router,): super();

  factory HomeVM.init(BuildContext context) {
    return HomeVM(AutoRouter.of(context));
  }

  redirectTo(String path) {
    _router.navigateNamed(path);
  }

  select(int id) {
    print('action with $id');
    if (selected.contains(id)) {
      selected.removeWhere((element) => element == id);
      print('done');
      notifyListeners();
    }
    else {
      selected.add(id);
    }
    notifyListeners();
  }

  List<int> get selectedFriends => selected;
}
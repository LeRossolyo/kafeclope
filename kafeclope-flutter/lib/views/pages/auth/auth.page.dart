import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

///
/// [AuthPage]
///
class AuthPage extends StatelessWidget {
  ///
  /// Constructor
  ///
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoRouter(
      builder: (BuildContext context, Widget content) {
        return Scaffold(body: content);
      },
    );
  }
}

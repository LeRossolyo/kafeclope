import 'package:flutter/material.dart';
import 'package:kafeclope/viewmodels/auth.vm.dart';
import 'package:kafeclope/views/widgets/login.form.widget.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AuthVM>(
      create: (context) => AuthVM.init(context),
      builder: (context, child) {
        final vm = Provider.of<AuthVM>(context);

        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            title: Text(
              'Kaféclope',
              style: Theme.of(context)
                  .textTheme
                  .displaySmall
                  ?.apply(color: Colors.green),
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              child: LoginForm(
                login: vm.login,
                redirect: vm.redirectTo,
              ),
            ),
          ),
        );
      },
    );
  }
}

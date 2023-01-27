import 'package:flutter/material.dart';
import 'package:kafeclope/viewmodels/auth.vm.dart';
import 'package:kafeclope/views/widgets/login.form.widget.dart';
import 'package:provider/provider.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AuthVM>(
      create: ((context) => AuthVM.init(context)),
      builder: (context, build) {
        final vm = Provider.of<AuthVM>(context, listen: false);
        
        return Scaffold(
          appBar: AppBar(
            title: const Text('Kafeclope'),
            leading: IconButton(
                onPressed: () => vm.redirectTo('home'),
                icon: const Icon(Icons.arrow_back)),
          ),
          body: LoginForm(login: vm.login),
        );
      },
    );
  }
}

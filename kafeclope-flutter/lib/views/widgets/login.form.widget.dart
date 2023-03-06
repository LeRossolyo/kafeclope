import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:kafeclope/views/widgets/buttons/button.main.dart';
import 'package:kafeclope/views/widgets/inputs/input.widget.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key, required this.login, required this.redirect});
  final Function login;
  final Function redirect;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              InputWidget(
                name: 'email',
                labelText: 'E-mail',
                errorText: 'Un e-mail est obligatoire',
              ),
              SizedBox(
                height: 14,
              ),
              InputWidget(
                name: 'password',
                labelText: 'Mot de passe',
                errorText: 'Mot de passe est obligatoire',
                secure: true,
              ),
            ],
          ),
          Column(
            children: [
              MainButton(
                label: 'Login',
                action: () async {
                  _formKey.currentState?.save();
                  print('Hello');
                  if (_formKey.currentState!.validate()) {
                    final formData = _formKey.currentState?.value;

                    try {
                      await widget.login(
                          formData!['email'], formData['password']);
                    } catch (e) {
                      print(e);
                    }
                  }
                },
                variant: buttonVariant.filled,
              ),
              TextButton(
                onPressed: () => widget.redirect('auth/register'),
                child: Text('Créer un compte'),
              )
            ],
          ),
        ],
      ),
    );
  }
}

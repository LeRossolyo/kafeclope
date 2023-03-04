import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:kafeclope/views/widgets/buttons/button.main.dart';
import 'package:kafeclope/views/widgets/inputs/input.widget.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm(
      {super.key, required this.register, required this.redirect});
  final Function register;
  final Function redirect;

  @override
  State<RegisterForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<RegisterForm> {
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
                name: 'kafeId',
                labelText: 'Kafé id',
                errorText: 'Un e-mail est obligatoire',
              ),
              SizedBox(
                height: 14,
              ),
              InputWidget(
                name: 'username',
                labelText: 'Nom d utilisateur',
                errorText: 'le nom d utilisateur est obligatoire',
              ),
              SizedBox(
                height: 14,
              ),
              InputWidget(
                name: 'email',
                labelText: 'E-mail',
                errorText: 'l email est obbligatoire',
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
                  if (_formKey.currentState!.validate()) {
                    final formData = _formKey.currentState?.value;

                    try {
                      await widget.register(
                        formData!['email'],
                        formData['password'],
                        formData['username'],
                        formData['kafeId'],
                      );
                    } catch (e) {
                      print(e);
                    }
                  }
                },
                variant: buttonVariant.filled,
              ),
              TextButton(
                onPressed: () => widget.redirect('auth/login'),
                child: Text('Se connecter'),
              )
            ],
          ),
        ],
      ),
    );
  }
}

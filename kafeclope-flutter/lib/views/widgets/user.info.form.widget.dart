import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:kafeclope/views/widgets/buttons/button.main.dart';
import 'package:kafeclope/views/widgets/inputs/input.widget.dart';

class UserInfoForm extends StatefulWidget {
  const UserInfoForm({super.key, required this.register, required this.update});
  final Function register;
  final Function update;

  @override
  State<UserInfoForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<UserInfoForm> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FormBuilder(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              children: [
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
                  label: 'Valider',
                  action: () async {
                    _formKey.currentState?.save();
                    if (_formKey.currentState!.validate()) {
                      final formData = _formKey.currentState?.value;

                      try {
                        await widget.update(
                          formData!['email'],
                          formData['password'],
                          formData['username'],
                        );
                      } catch (e) {
                        print(e);
                      }
                    }
                  },
                  variant: buttonVariant.filled,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

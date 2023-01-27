import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key, required this.login});
  final Function login;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FormBuilder(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FormBuilderTextField(
              name: 'email',
              decoration: const InputDecoration(labelText: 'Email'),
              validator: (value) => value == null || value.isEmpty
                  ? 'Please enter some text'
                  : null,
            ),
            FormBuilderTextField(
              name: 'password',
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
              validator: (value) => value == null || value.isEmpty
                  ? 'Please enter some text'
                  : null,
            ),
            ElevatedButton(
              onPressed: () async {
                _formKey.currentState?.save();
                if (_formKey.currentState!.validate()) {
                  final formData = _formKey.currentState?.value;

                  try {
                    await widget.login(formData!['email'], formData['password']);
                  } catch (e) {
                    print(e);
                  }
                }
              },
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}

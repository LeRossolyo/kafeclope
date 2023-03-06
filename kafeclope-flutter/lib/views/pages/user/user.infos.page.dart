import 'package:flutter/material.dart';
import 'package:kafeclope/views/widgets/user.info.form.widget.dart';
import 'package:kafeclope/views/widgets/utils/user.profile.pic.selection.widget.dart';

class UserInfoPage extends StatelessWidget {
  const UserInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kaféclope',
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.apply(color: Colors.white)),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              UserProfilePicSelection(showModal: () => print('hola')),
              SizedBox(
                height: 30,
              ),
              UserInfoForm(
                register: () => print('Hola'),
                update: () => print('Hola'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

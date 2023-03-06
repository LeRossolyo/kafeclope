import 'package:flutter/material.dart';
import 'package:kafeclope/viewmodels/auth.vm.dart';
import 'package:kafeclope/views/widgets/buttons/button.main.dart';
import 'package:kafeclope/views/widgets/utils/user.profile.pic.selection.widget.dart';
import 'package:provider/provider.dart';

class RegisterPicturePage extends StatelessWidget {
  const RegisterPicturePage({super.key});

  _showModal(context) {
    final vm = Provider.of<AuthVM>(context, listen: false);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Veuillez ajouter votre photo'),
          actions: [
            ElevatedButton(
              onPressed: () => vm.addProfilePicture(),
              child: Text('Ajouter une photo'),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AuthVM>(
      create: (context) => AuthVM.init(context),
      builder: (context, child) {
        final vm = Provider.of<AuthVM>(context, listen: false);

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
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Salut Hugo',
                ),
                UserProfilePicSelection(showModal: () => _showModal(context)),
                MainButton(
                  label: 'Parfait',
                  action: () => print('hola'),
                  variant: buttonVariant.disabled,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

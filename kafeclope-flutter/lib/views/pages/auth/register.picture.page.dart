import 'package:flutter/material.dart';
import 'package:kafeclope/viewmodels/auth.vm.dart';
import 'package:kafeclope/views/widgets/buttons/button.main.dart';
import 'package:provider/provider.dart';

class RegisterPicturePage extends StatelessWidget {
  const RegisterPicturePage({super.key});

  _showModal(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Veuillez ajouter votre photo'),
          actions: [
            ElevatedButton(
              onPressed: () => print('Hola'),
              child: Text('Hola'),
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
          body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Salut Hugo',
                  ),
                  Container(
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 80,
                          backgroundImage: NetworkImage(
                            'https://prmeng.rosselcdn.net/sites/default/files/dpistyles_v2/ena_16_9_extra_big/2020/10/25/node_135639/37664040/public/2020/10/25/B9725044643Z.1_20201025110306_000%2BGMCGUKBSR.1-0.jpg?itok=jt7ohrsT1603620193',
                          ),
                        ),
                        Positioned(
                          right: 0.0,
                          bottom: 0.0,
                          child: CircleAvatar(
                            maxRadius: 25,
                            child: IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () => _showModal(context),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  MainButton(
                    label: 'Parfait',
                    action: () => print('hola'),
                    variant: buttonVariant.disabled,
                  ),
                ]),
          ),
        );
      },
    );
  }
}

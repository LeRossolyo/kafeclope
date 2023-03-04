import 'package:flutter/material.dart';
import 'package:kafeclope/viewmodels/user.vm.dart';
import 'package:kafeclope/views/widgets/utils/drawer.widget.dart';
import 'package:kafeclope/views/widgets/utils/utils.tile.dart';
import 'package:provider/provider.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserVM>(
      create: (context) => UserVM.init(context),
      builder: (context, child) {
        final vm = Provider.of<UserVM>(context);

        return Scaffold(
          drawer: DrawerApp(),
          appBar: AppBar(
            title: Text('Kaféclope',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.apply(color: Colors.white)),
          ),
          body: Container(
            padding: const EdgeInsets.symmetric(vertical: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(
                        'https://prmeng.rosselcdn.net/sites/default/files/dpistyles_v2/ena_16_9_extra_big/2020/10/25/node_135639/37664040/public/2020/10/25/B9725044643Z.1_20201025110306_000%2BGMCGUKBSR.1-0.jpg?itok=jt7ohrsT1603620193',
                      ),
                    ),
                    Text(
                      'Hello',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.apply(color: Colors.green),
                    ),
                    Text(
                      'Hello',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.apply(color: Colors.grey),
                    ),
                    UtilsTile(
                      icon: Icons.person_outline,
                      label: 'Informations',
                      redirect: () => print('hola'),
                    ),
                    UtilsTile(
                      icon: Icons.bar_chart,
                      label: 'Statistiques',
                      redirect: () => print('hola'),
                    ),
                    UtilsTile(
                      icon: Icons.workspace_premium_outlined,
                      label: 'Trophées',
                      redirect: () => print('hola'),
                    ),
                  ],
                ),
                Column(
                  children: [
                    UtilsTile(
                      icon: Icons.dark_mode_outlined,
                      label: 'Déconexion',
                      redirect: vm.disconnect,
                    ),
                    UtilsTile(
                      icon: Icons.delete_forever_outlined,
                      label: 'Supprimer',
                      redirect: () => print('hola'),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

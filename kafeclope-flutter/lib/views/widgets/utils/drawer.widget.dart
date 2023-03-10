import 'package:flutter/material.dart';
import 'package:kafeclope/viewmodels/drawer.vm.dart';
import 'package:kafeclope/views/widgets/utils/user.profile.pic.widget.dart';
import 'package:provider/provider.dart';

class DrawerApp extends StatelessWidget {
  const DrawerApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DrawerViewModel>(
      create: ((context) => DrawerViewModel.init(context)),
      builder: (context, child) {
        final vm = Provider.of<DrawerViewModel>(context);

        return Drawer(
          backgroundColor: Colors.green,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      UserProfilePic(
                        profil_pic:
                            'https://prmeng.rosselcdn.net/sites/default/files/dpistyles_v2/ena_16_9_extra_big/2020/10/25/node_135639/37664040/public/2020/10/25/B9725044643Z.1_20201025110306_000%2BGMCGUKBSR.1-0.jpg?itok=jt7ohrsT1603620193',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Hugo Mialhe',
                              style: Theme.of(context).textTheme.titleLarge),
                          IconButton(
                              onPressed: () {
                                vm.redirectTo('user/home');
                              },
                              icon: Icon(
                                Icons.settings,
                                size: 20,
                                color: Colors.green,
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(
                        onPressed: () {
                          vm.redirectTo('home');
                        },
                        child: Text(
                          'Home',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.apply(color: Colors.white),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          vm.redirectTo('friend');
                        },
                        child: Text(
                          'Historique',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.apply(color: Colors.white),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          vm.redirectTo('friend');
                        },
                        child: Text(
                          'Mes amis',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.apply(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

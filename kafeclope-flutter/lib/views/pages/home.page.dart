import 'package:flutter/material.dart';
import 'package:kafeclope/views/widgets/buttons/button.action.dart';
import 'package:kafeclope/views/widgets/buttons/button.icon.dart';
import 'package:kafeclope/views/widgets/buttons/button.main.dart';
import 'package:kafeclope/views/widgets/tiles/user.tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.brown,
        child: Column(
          children: [
            const Text('moi'),
            const Text('moi'),
          ],
        ),
      ),
      appBar: AppBar(
        title: 
            Text('Kaféclope',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.apply(color: Colors.white)),

        ),
      body: Center(
          child: Column(
        children: [
          MainButton(
            action: () => print('Test'),
            variant: buttonVariant.disabled,
          ),
          ButtonAction(variant: buttonActionVariant.filled),
          ButtonAction(variant: buttonActionVariant.unfilled),
          ButtonIcon(variant: buttonIconVariant.added),
          ButtonIcon(variant: buttonIconVariant.add),
          ButtonIcon(variant: buttonIconVariant.remove),
          UserTile(variant: userTileVariant.add),
          UserTile(variant: userTileVariant.added),
          UserTile(variant: userTileVariant.remove),
          UserTile(variant: userTileVariant.ask),
        ],
      )),
    );
  }
}

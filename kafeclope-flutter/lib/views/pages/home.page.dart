import 'package:flutter/material.dart';
import 'package:kafeclope/views/widgets/buttons/button.action.dart';
import 'package:kafeclope/views/widgets/buttons/button.icon.dart';
import 'package:kafeclope/views/widgets/buttons/button.main.dart';
import 'package:kafeclope/views/widgets/inputs/input.widget.dart';
import 'package:kafeclope/views/widgets/inputs/search.input.dart';
import 'package:kafeclope/views/widgets/tiles/historic.tile.dart';
import 'package:kafeclope/views/widgets/tiles/user.select.tile.dart';
import 'package:kafeclope/views/widgets/tiles/user.tile.dart';
import 'package:kafeclope/views/widgets/utils/drawer.widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerApp(),
      appBar: AppBar(
        title: Text('Kaféclope',
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.apply(color: Colors.white)),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          MainButton(
            action: () => print('Test'),
            variant: buttonVariant.disabled,
          ),
          ButtonAction(variant: buttonActionVariant.filled),
          ButtonIcon(variant: buttonIconVariant.remove),
          UserTile(variant: userTileVariant.added),
          Row(
            children: [
              UserSelectTile(
                variant: userSelectedVariant.selected, 
              ),
              UserSelectTile(
                variant: userSelectedVariant.notselected,
              ),
            ],
          ),
          InputWidget(
            labelText: 'E-mail',
            errorText: 'Send Location',
            secure: true,
          ),
          SearchInput(),
          HistoricTile(),
        ],
      )),
    );
  }
}

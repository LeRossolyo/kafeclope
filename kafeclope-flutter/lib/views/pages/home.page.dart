import 'package:flutter/material.dart';
import 'package:kafeclope/views/widgets/buttons/button.action.dart';
import 'package:kafeclope/views/widgets/inputs/search.input.dart';
import 'package:kafeclope/views/widgets/tiles/user.select.tile.dart';
import 'package:kafeclope/views/widgets/utils/drawer.widget.dart';
import 'package:kafeclope/views/widgets/utils/kafe.dialogue.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  _showKafeModal(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return KafeDialog(
              create_kafe: (title, description) =>
                  print('$title & $description'));
        });
  }

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
      body: Column(
        children: [
          SearchInput(),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: [
                UserSelectTile(variant: userSelectedVariant.notselected),
                UserSelectTile(variant: userSelectedVariant.notselected),
                UserSelectTile(variant: userSelectedVariant.selected)
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: ButtonAction(
        label: 'Kafféclope',
        variant: buttonActionVariant.filled,
        action: () => _showKafeModal(context),
      ),
    );
  }
}

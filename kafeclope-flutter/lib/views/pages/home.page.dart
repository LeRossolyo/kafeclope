import 'package:flutter/material.dart';
import 'package:kafeclope/views/widgets/button.action.dart';
import 'package:kafeclope/views/widgets/button.icon.dart';
import 'package:kafeclope/views/widgets/button.main.dart';

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
            Text('Kaféclope', style: Theme.of(context).textTheme.displaySmall),
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
        ],
      )),
    );
  }
}

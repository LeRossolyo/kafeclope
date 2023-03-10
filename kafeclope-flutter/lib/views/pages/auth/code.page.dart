import 'package:flutter/material.dart';
import 'package:kafeclope/views/widgets/buttons/button.main.dart';
import 'package:kafeclope/views/widgets/inputs/input.widget.dart';

class CodePage extends StatelessWidget {
  const CodePage({super.key});

  @override
  Widget build(BuildContext context) {
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
        children: [
          InputWidget(
            name: 'Code',
            labelText: 'code recu par mail',
            errorText: "Le code n'est pas bon",
          ),
          MainButton(
            label: 'Valider',
            action: () => print('Valider'),
            variant: buttonVariant.filled,
          )
        ],
      )),
    );
  }
}

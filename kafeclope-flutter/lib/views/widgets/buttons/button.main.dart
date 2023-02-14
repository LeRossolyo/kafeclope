import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum buttonVariant {
  filled,
  disabled;

  ButtonStyle buttonStyle() {
    switch (this) {
      case buttonVariant.filled:
        return ElevatedButton.styleFrom(
          backgroundColor: Colors.brown,
          minimumSize: const Size(332, 53),
        );
      case buttonVariant.disabled:
        return ElevatedButton.styleFrom(
          backgroundColor: Colors.grey,
          minimumSize: const Size(332, 53),
        );
    }
  }

  TextStyle? textStyle(BuildContext context) {
    switch (this) {
      case buttonVariant.filled:
        return Theme.of(context).textTheme.headlineSmall?.apply(color: Colors.white);
      case buttonVariant.disabled:
        return Theme.of(context).textTheme.headlineSmall?.apply(color: Colors.white);
    }
  }
}

class MainButton extends StatelessWidget {
  const MainButton({super.key, required this.action, required this.variant});
  final Function action;
  final buttonVariant variant;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: variant.buttonStyle(),
      onPressed: () => action,
      child: Text(
        'Bonjour',
        style: variant.textStyle(context),
      ),
    );
  }
}

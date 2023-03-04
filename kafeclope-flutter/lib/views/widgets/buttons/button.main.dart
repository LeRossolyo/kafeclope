import 'package:flutter/material.dart';

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
        return Theme.of(context)
            .textTheme
            .headlineSmall
            ?.apply(color: Colors.white);
      case buttonVariant.disabled:
        return Theme.of(context)
            .textTheme
            .headlineSmall
            ?.apply(color: Colors.white);
    }
  }
}

class MainButton extends StatelessWidget {
  const MainButton(
      {super.key,
      required this.label,
      required this.action,
      required this.variant});
  final String label;
  final Function action;
  final buttonVariant variant;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: variant.buttonStyle(),
      onPressed: variant == buttonVariant.disabled ? null : () => action(),
      child: Text(
        label,
        style: variant.textStyle(context),
      ),
    );
  }
}

import 'package:flutter/material.dart';

enum buttonActionVariant {
  filled,
  unfilled;

  Widget buttonstyle(label, action, variant, context) {
    switch (this) {
      case buttonActionVariant.filled:
        return FloatingActionButton.extended(
          backgroundColor: Colors.brown,
          label: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(label, style: variant.textStyle(context)),
          ),
          onPressed: action,
        );
      case buttonActionVariant.unfilled:
        return Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 5),
              borderRadius: BorderRadius.all(Radius.circular(30))),
          child: FloatingActionButton.extended(
            label: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(label, style: variant.textStyle(context)),
            ),
            backgroundColor: Colors.green,
            onPressed: action,
          ),
        );
    }
  }

  TextStyle? textStyle(BuildContext context) {
    switch (this) {
      case buttonActionVariant.filled:
        return Theme.of(context)
            .textTheme
            .headlineSmall
            ?.apply(color: Colors.white);
      case buttonActionVariant.unfilled:
        return Theme.of(context)
            .textTheme
            .headlineSmall
            ?.apply(color: Colors.white);
    }
  }
}

class ButtonAction extends StatelessWidget {
  const ButtonAction(
      {super.key,
      required this.variant,
      required this.action,
      required this.label});
  final buttonActionVariant variant;
  final Function action;
  final String label;

  @override
  Widget build(BuildContext context) {
    return variant.buttonstyle(
      label,
      action,
      variant,
      context,
    );
  }
}

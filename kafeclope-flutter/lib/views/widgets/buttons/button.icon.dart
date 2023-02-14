import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum buttonIconVariant {
  add,
  added,
  remove;

  ButtonStyle? buttonStyle() {
    switch (this) {
      case buttonIconVariant.add:
        return ButtonStyle(
          side: MaterialStatePropertyAll(
            BorderSide(
              color: Colors.green,
              width: 2,
            ),
          ),
          minimumSize: MaterialStatePropertyAll(Size(40, 40)),
        );
      case buttonIconVariant.added:
        return ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.green),
          minimumSize: MaterialStatePropertyAll(Size(40, 40)),
        );
      case buttonIconVariant.remove:
        return ButtonStyle(
          side: MaterialStatePropertyAll(
            BorderSide(
              color: Colors.red,
              width: 2,
            ),
          ),
          minimumSize: MaterialStatePropertyAll(Size(40, 40)),
        );
    }
  }

  Icon icon() {
    switch (this) {
      case buttonIconVariant.add:
        return Icon(
          Icons.person_add,
          size: 24,
        );
      case buttonIconVariant.added:
        return Icon(Icons.send, size: 24, color: Colors.white,);
      case buttonIconVariant.remove:
        return Icon(
          Icons.delete_forever_rounded,
          size: 25,
          color: Colors.red,
        );
    }
  }
}

class ButtonIcon extends StatelessWidget {
  const ButtonIcon({super.key, required this.variant});
  final buttonIconVariant variant;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        print('hello');
      },
      style: variant.buttonStyle(),
      child: variant.icon(),
    );
  }
}

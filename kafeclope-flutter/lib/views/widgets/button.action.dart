import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
            backgroundColor: Colors.green,
            label: Text(label, style: variant.textStyle(context)),
            onPressed: action,
          ),
        );
    }
  }

  TextStyle? textStyle(BuildContext context) {
    switch (this) {
      case buttonActionVariant.filled:
        return GoogleFonts.amaranth(fontSize: 24, color: Colors.white);
      case buttonActionVariant.unfilled:
        return GoogleFonts.amaranth(fontSize: 24, color: Colors.white);
    }
  }
}

class ButtonAction extends StatelessWidget {
  const ButtonAction({super.key, required this.variant});
  final buttonActionVariant variant;

  @override
  Widget build(BuildContext context) {
    return variant.buttonstyle('Kaféclope ?', () {
      print('Helo');
    }, variant, context);
  }
}

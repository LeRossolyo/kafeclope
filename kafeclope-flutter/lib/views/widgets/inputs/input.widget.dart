import 'package:flutter/material.dart';

class InputWidget extends StatefulWidget {
  InputWidget({
    super.key,
    required this.labelText,
    required this.errorText,
    this.secure = false,
  });
  final String labelText;
  final String errorText;
  final bool secure;
  late bool _textVisible = secure;

  @override
  State<InputWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return widget.errorText;
        }
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: widget.labelText,
        suffixIcon: widget.secure
            ? IconButton(
                onPressed: () {
                  setState(() {
                    widget._textVisible = !widget._textVisible;
                  });
                },
                icon: Icon(widget._textVisible
                    ? Icons.visibility
                    : Icons.visibility_off),
              )
            : null,
      ),
      obscureText: widget._textVisible,
    );
  }
}

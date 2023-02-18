import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SearchInput extends StatefulWidget {
  SearchInput({
    super.key,
  });
  late bool empty = true;

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: myController,
      decoration: InputDecoration(
        border: UnderlineInputBorder(),
        label: const Text('Rechercher un ami'),
        prefixIcon: Icon(Icons.search),
        suffixIcon: widget.empty
            ? null
            : IconButton(
                icon: Icon(Icons.remove),
                onPressed: myController.clear,
              ),
      ),   
      );
  }
}

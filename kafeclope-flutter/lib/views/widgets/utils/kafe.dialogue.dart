import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:kafeclope/views/widgets/buttons/button.action.dart';
import 'package:kafeclope/views/widgets/inputs/input.widget.dart';

class KafeDialog extends StatefulWidget {
  const KafeDialog({super.key, required this.create_kafe});
  final Function create_kafe;

  @override
  State<KafeDialog> createState() => _KafeDialogStats();
}

class _KafeDialogStats extends State<KafeDialog> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Container(
          child: FormBuilder(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  children: [
                    Text(
                      'Pret pour la pause',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Proposition de pause envoyé a :',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Text(
                      'Hugo, Veli',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                InputWidget(
                  name: 'title',
                  secure: false,
                  labelText: 'Nom de la pause',
                  errorText: 'La pause doit avoir un nom',
                ),
                SizedBox(
                  height: 10,
                ),
                InputWidget(
                  name: 'description',
                  secure: false,
                  labelText: 'Description de la pause',
                  errorText: 'La pause doit avoir un nom',
                  multiline: true,
                ),
                SizedBox(
                  height: 20,
                ),
                ButtonAction(
                  label: 'Créer la pause',
                  variant: buttonActionVariant.filled,
                  action: () async {
                    _formKey.currentState?.save();
                    if (_formKey.currentState!.validate()) {
                      final formData = _formKey.currentState?.value;

                      try {
                        await widget.create_kafe(
                            formData!['title'], formData['description']);
                      } catch (e) {
                        print(e);
                      }
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

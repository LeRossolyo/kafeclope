import 'package:flutter/material.dart';

class UtilsTile extends StatelessWidget {
  const UtilsTile({
    super.key,
    required this.icon,
    required this.label,
    required this.redirect,
  });
  final IconData icon;
  final String label;
  final Function redirect;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey, width: 1))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon),
              SizedBox(width: 10),
              Text(label, style: Theme.of(context).textTheme.bodyLarge),
            ],
          ),
          IconButton(
            icon: Icon(
              Icons.arrow_forward,
              color: Colors.green,
            ),
            onPressed: () => redirect(),
          )
        ],
      ),
    );
  }
}

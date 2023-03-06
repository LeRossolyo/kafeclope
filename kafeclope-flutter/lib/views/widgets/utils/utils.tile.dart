import 'package:flutter/material.dart';

class UtilsTile extends StatelessWidget {
  const UtilsTile({
    super.key,
    required this.icon,
    required this.label,
    required this.redirect,
    this.red = false,
  });
  final IconData icon;
  final String label;
  final Function redirect;
  final bool red;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => redirect(),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey, width: 1))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: red ? Colors.red : Colors.black,
                ),
                SizedBox(width: 20),
                Text(
                  label,
                  style: red
                      ? Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.apply(color: Colors.red)
                      : Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
            Icon(
              Icons.arrow_forward,
              color: red ? Colors.red : Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}

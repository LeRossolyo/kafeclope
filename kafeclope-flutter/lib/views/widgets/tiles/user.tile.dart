import 'package:flutter/material.dart';
import 'package:kafeclope/views/widgets/buttons/button.icon.dart';

enum userTileVariant {
  add,
  added,
  ask,
  remove;

  buttonIconVariant getIconVariant() {
    switch (this) {
      case add:
        return buttonIconVariant.add;
      case added:
        return buttonIconVariant.added;
      case ask:
        return buttonIconVariant.remove;
      case remove:
        return buttonIconVariant.remove;
    }
  }
}

class UserTile extends StatelessWidget {
  const UserTile({super.key, required this.variant});
  final userTileVariant variant;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
        bottom: BorderSide(color: Colors.grey, width: 2),
      )),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://i.ytimg.com/vi/stDSVLLqEso/maxresdefault.jpg',
                  ),
                  radius: 40,
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hugo',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.apply(color: Colors.green),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text('@hugo_ca_pue',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.apply(color: Colors.brown, fontWeightDelta: 15)),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                variant == userTileVariant.ask
                    ? ButtonIcon(variant: buttonIconVariant.add)
                    : Container(),
                ButtonIcon(variant: variant.getIconVariant()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

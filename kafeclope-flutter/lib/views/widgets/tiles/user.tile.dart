import 'package:flutter/material.dart';
import 'package:kafeclope/views/widgets/buttons/button.icon.dart';
import 'package:kafeclope/views/widgets/utils/user.profile.pic.widget.dart';

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
                UserProfilePic(
                  profil_pic:
                      'https://prmeng.rosselcdn.net/sites/default/files/dpistyles_v2/ena_16_9_extra_big/2020/10/25/node_135639/37664040/public/2020/10/25/B9725044643Z.1_20201025110306_000%2BGMCGUKBSR.1-0.jpg?itok=jt7ohrsT1603620193',
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


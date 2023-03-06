import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:kafeclope/views/widgets/utils/user.profile.pic.widget.dart';

class HistoricTile extends StatelessWidget {
  const HistoricTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey, width: 2),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          right: 24.0,
          left: 8.0,
          top: 8.0,
          bottom: 8.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                UserProfilePic(
                  profil_pic:
                      'https://prmeng.rosselcdn.net/sites/default/files/dpistyles_v2/ena_16_9_extra_big/2020/10/25/node_135639/37664040/public/2020/10/25/B9725044643Z.1_20201025110306_000%2BGMCGUKBSR.1-0.jpg?itok=jt7ohrsT1603620193',
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nom du kafé',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Date du kafé',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.check_circle_outline,
                      color: Colors.green,
                      size: 24,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('2', style: Theme.of(context).textTheme.titleMedium)
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.cancel_outlined, color: Colors.red, size: 24),
                    SizedBox(
                      width: 10,
                    ),
                    Text('2', style: Theme.of(context).textTheme.titleMedium)
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

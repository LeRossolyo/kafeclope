import 'package:flutter/material.dart';

class UserProfilePicSelection extends StatelessWidget {
  const UserProfilePicSelection({super.key, required this.showModal});
  final Function showModal;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 80,
            backgroundImage: NetworkImage(
              'https://prmeng.rosselcdn.net/sites/default/files/dpistyles_v2/ena_16_9_extra_big/2020/10/25/node_135639/37664040/public/2020/10/25/B9725044643Z.1_20201025110306_000%2BGMCGUKBSR.1-0.jpg?itok=jt7ohrsT1603620193',
            ),
          ),
          Positioned(
            right: 0.0,
            bottom: 0.0,
            child: CircleAvatar(
              maxRadius: 25,
              child: IconButton(
                icon: Icon(Icons.edit),
                onPressed: () => showModal(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

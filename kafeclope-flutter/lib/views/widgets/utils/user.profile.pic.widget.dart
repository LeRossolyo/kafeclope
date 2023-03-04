import 'package:flutter/material.dart';

class UserProfilePic extends StatelessWidget {
  const UserProfilePic({super.key, required this.profil_pic, this.coffee = -1});
  final String profil_pic;
  final int coffee;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(profil_pic),
          ),
          coffee != -1
              ? Positioned(
                  right: 0.0,
                  bottom: 0.0,
                  child: CircleAvatar(
                    maxRadius: 15,
                    child: coffee > 0
                        ? Text(
                            coffee.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.apply(color: Colors.white),
                          )
                        : Icon(
                            Icons.coffee,
                            size: 16,
                          ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}

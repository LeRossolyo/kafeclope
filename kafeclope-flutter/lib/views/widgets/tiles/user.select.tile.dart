import 'package:flutter/material.dart';
import 'package:kafeclope/views/widgets/utils/user.profile.pic.widget.dart';

enum userSelectedVariant { selected, notselected;

  Border? is_selected() {
    switch (this) {
      case userSelectedVariant.selected:
        return Border.all(color: Colors.green, width: 5);
      case userSelectedVariant.notselected:
        return null;
    }
  }

}

class UserSelectTile extends StatelessWidget {
  const UserSelectTile({super.key, required this.variant});
  final userSelectedVariant variant;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('hugo is selected');
      },
      child: Container(
        width: 130,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: variant.is_selected(),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 3,
              offset: Offset(0, 4), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              UserProfilePic(
                profil_pic:
                    'https://prmeng.rosselcdn.net/sites/default/files/dpistyles_v2/ena_16_9_extra_big/2020/10/25/node_135639/37664040/public/2020/10/25/B9725044643Z.1_20201025110306_000%2BGMCGUKBSR.1-0.jpg?itok=jt7ohrsT1603620193',
                coffee: 0,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Hugo',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.apply(color: Colors.green),
              ),
              Text('Hugo', style: Theme.of(context).textTheme.bodySmall)
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:website/helpers/sizes_helpers.dart';
import 'package:website/widgets/navigation_bar/navigation_bar_item.dart';

class DrawerItem extends StatelessWidget {
  final String drawerTitle;
  final IconData icon;
  final String routePath;
  const DrawerItem({this.drawerTitle, this.icon, this.routePath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 30),
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            color: Colors.white,
          ),
          SizedBox(
            width: displayWidth(context) * 0.05,
          ),
          NavigationBarItem(
            title: drawerTitle,
            routePath: routePath,
          ),
        ],
      ),
    );
  }
}

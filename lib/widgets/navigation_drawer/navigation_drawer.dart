import 'package:flutter/material.dart';
import 'package:website/helpers/sizes_helpers.dart';
import 'package:website/routing/router.gr.dart';
import 'package:website/widgets/navigation_drawer/drawer_item.dart';
import 'package:website/widgets/navigation_drawer/navigation_drawer_header.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: displayWidth(context) * 0.7,
      decoration: BoxDecoration(
        color: Colors.black,
        boxShadow: [
          BoxShadow(color: Colors.black, blurRadius: 16),
        ],
      ),
      child: Column(
        children: <Widget>[
          NavigationDrawerHeader(),
          DrawerItem(
              drawerTitle: 'Apps',
              icon: Icons.apps,
              routePath: Router.appsView),
          DrawerItem(
              drawerTitle: 'Movies',
              icon: Icons.ondemand_video,
              routePath: Router.moviesView),
        ],
      ),
    );
  }
}

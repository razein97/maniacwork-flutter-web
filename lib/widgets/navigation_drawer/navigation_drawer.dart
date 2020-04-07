import 'package:flutter/material.dart';
import 'package:website/helpers/sizes_helpers.dart';
import 'package:website/routing/router.gr.dart';
import 'package:website/widgets/navigation_bar_item/navigation_bar_item.dart';
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
          NavigationBarItem(
            'Apps',
            Routes.apps,
            icon: Icons.apps,
          ),
          NavigationBarItem(
            'Movies',
            Routes.movies,
            icon: Icons.ondemand_video,
          ),
        ],
      ),
    );
  }
}

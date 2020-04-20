import 'package:flutter/material.dart';
import 'package:website/helpers/sizes_helpers.dart';
import 'package:website/widgets/navigation_bar/navigation_bar_logo.dart';
import 'package:website/extensions/hover_extensions.dart';

class NavigationBarMobile extends StatelessWidget {
  final double navBarHeight;
  const NavigationBarMobile({Key key, this.navBarHeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      height: displayHeight(context) * navBarHeight,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: Icon(
              Icons.menu,
              color: Colors.white,
            ),
          ).showCursorOnHover,
          NavigationBarLogo(),
        ],
      ),
    );
  }
}

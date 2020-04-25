import 'package:flutter/material.dart';
import 'package:website/helpers/sizes_helpers.dart';
import 'package:website/routing/router.gr.dart';
import 'package:website/widgets/centered_view/centered_view.dart';
import 'package:website/widgets/navigation_bar/navigation_bar_logo.dart';
import 'package:website/widgets/navigation_bar_item/navigation_bar_item.dart';

class NavigationBarTablet extends StatelessWidget {
  final double navBarHeight;
  const NavigationBarTablet({Key key, this.navBarHeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double dNavigationBarHeight = SizeHelper.displayWidth * navBarHeight;
    return Container(
      color: Colors.transparent,
      height: dNavigationBarHeight,
      child: CenteredView(
        vPadding: 0,
        hPadding: 20.0,
        maxWidth: 1500,
        maxHeight: 2000,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            NavigationBarLogo(),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                NavigationBarItem(
                  'Apps',
                  Routes.apps,
                ),
                NavigationBarItem(
                  'Movies',
                  Routes.movies,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

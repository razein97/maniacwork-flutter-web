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
    double dSizedBox = displayWidth(context) * 0.05;
    double dNavigationBarHeight = displayWidth(context) * navBarHeight;
    return Container(
      color: Colors.black,
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
                SizedBox(
                  width: dSizedBox,
                ),
                NavigationBarItem(
                  'Movies',
                  Routes.movies,
                ),
                SizedBox(
                  width: dSizedBox,
                ),

                //TODO: Implement other menus.
                // NavigationBarItem(
                //   title: 'SourceCode',
                //   routePath: Router.View,
                // ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

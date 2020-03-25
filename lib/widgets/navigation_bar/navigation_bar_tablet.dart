import 'package:flutter/material.dart';
import 'package:website/helpers/sizes_helpers.dart';
import 'package:website/routing/router.gr.dart';
import 'package:website/widgets/navigation_bar/navigation_bar_item.dart';
import 'package:website/widgets/navigation_bar/navigation_bar_logo.dart';

class NavigationBarTablet extends StatelessWidget {
  const NavigationBarTablet({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double dSizedBox = displayWidth(context) * 0.05;
    double dFontSize = displayWidth(context) * 0.06;
    double dNavigationBarHeight = displayHeight(context) * 0.06;
    return Container(
      color: Colors.black,
      height: dNavigationBarHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          NavigationBarLogo(),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              NavigationBarItem(
                title: 'Apps',
                routePath: Router.appsView,
              ),
              SizedBox(
                width: dSizedBox,
              ),
              NavigationBarItem(
                title: 'Movies',
                routePath: Router.moviesView,
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
    );
  }
}

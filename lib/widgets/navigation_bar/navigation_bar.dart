import 'package:flutter/material.dart';
import 'package:website/responsive_builder/responsive_builder.dart';
import 'package:website/widgets/navigation_bar/navigation_bar_desktop.dart';
import 'package:website/widgets/navigation_bar/navigation_bar_mobile.dart';
import 'package:website/widgets/navigation_bar/navigation_bar_tablet.dart';

class NavigationBar extends StatelessWidget {
  const NavigationBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobileTabletNormal: (BuildContext context) => OrientationLayoutBuilder(
        portrait: (context) => NavigationBarMobile(
          navBarHeight: 0.075,
        ),
        landscape: (context) => NavigationBarMobile(
          navBarHeight: 0.13,
        ),
      ),
      tabletLarge: (BuildContext context) => OrientationLayoutBuilder(
        portrait: (context) => NavigationBarTablet(
          navBarHeight: 0.08,
        ),
        landscape: (context) => NavigationBarTablet(
          navBarHeight: 0.06,
        ),
      ),
      monitorLarge: (BuildContext context) => NavigationBarDesktop(),
    );
  }
}

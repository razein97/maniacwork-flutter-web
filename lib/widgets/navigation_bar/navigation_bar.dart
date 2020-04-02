import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:website/widgets/navigation_bar/navigation_bar_desktop.dart';
import 'package:website/widgets/navigation_bar/navigation_bar_mobile.dart';
import 'package:website/widgets/navigation_bar/navigation_bar_tablet.dart';

class NavigationBar extends StatelessWidget {
  const NavigationBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => NavigationBarMobile(),
      tablet: (BuildContext context) => NavigationBarTablet(),
      desktop: (BuildContext context) => NavigationBarDesktop(),
    );
  }
}
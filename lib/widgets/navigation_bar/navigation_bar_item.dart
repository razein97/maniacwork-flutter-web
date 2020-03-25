import 'package:flutter/material.dart';
import 'package:website/helpers/sizes_helpers.dart';
import 'package:website/routing/router.gr.dart';
import 'package:website/extensions/hover_extensions.dart';
import 'package:responsive_builder/responsive_builder.dart';

class NavigationBarItem extends StatelessWidget {
  final String title;
  final String routePath;
  const NavigationBarItem({@required this.title, @required this.routePath});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Router.navigator.pushNamed(routePath);
      },
      child: Text(
        title,
        style:
            TextStyle(fontSize: overrideFontSize(context), color: Colors.white),
      ).showCursorOnHover,
    );
  }

  double overrideFontSize(BuildContext context) {
    if (displayWidth(context) > 950) {
      return 18.0;
    } else if (displayWidth(context) > 600) {
      return 16.0;
    } else {
      return 15.0;
    }
  }
}

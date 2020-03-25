import 'package:flutter/material.dart';
import 'package:website/helpers/sizes_helpers.dart';
import 'package:website/widgets/navigation_bar/navigation_bar_logo.dart';
import 'package:website/extensions/hover_extensions.dart';

class NavigationDrawerHeader extends StatelessWidget {
  const NavigationDrawerHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: displayHeight(context) * 0.2,
      color: Colors.amber,
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          NavigationBarLogo(),
          Text(
            'Maniacwork',
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.w700, color: Colors.white),
          )
        ],
      ),
    ).showCursorOnHover;
  }
}

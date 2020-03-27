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
        color: Colors.cyan,
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 14.0, top: 14.0),
                  child: GestureDetector(
                    onTap: () {
                      Scaffold.of(context).openEndDrawer();
                    },
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ).showCursorOnHover,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                NavigationBarLogo(),
                Text(
                  'Maniacwork',
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              ],
            ).showCursorOnHover,
          ],
        ));
  }
}

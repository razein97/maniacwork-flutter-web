import 'package:flutter/material.dart';
import 'package:website/helpers/sizes_helpers.dart';
import 'package:website/routing/router.gr.dart';
import 'package:website/widgets/centered_view/centered_view.dart';
import 'package:website/widgets/navigation_bar/navigation_bar_logo.dart';
import 'package:website/widgets/navigation_bar_item/navigation_bar_item.dart';

class NavigationBarDesktop extends StatelessWidget
    implements PreferredSizeWidget {
  final Size preferredSize;
  NavigationBarDesktop() : preferredSize = Size.fromHeight(100.0);

  @override
  Widget build(BuildContext context) {
    double dSizedBox = SizeHelper.displayWidth * 0.02;
    double dNavigationBarHeight = SizeHelper.displayHeight * 0.06;
    return Container(
      color: Colors.transparent,
      height: dNavigationBarHeight,
      child: CenteredView(
        hPadding: 50.0,
        vPadding: 0,
        maxWidth: SizeHelper.displayWidth <= 1280
            ? SizeHelper.displayWidth * 0.9
            : SizeHelper.displayWidth * 0.8,
        maxHeight: SizeHelper.displayHeight * 0.1,
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
                SizedBox(
                  width: dSizedBox,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

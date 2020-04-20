import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:website/data_models/navigation_bar_item_model.dart';
import 'package:website/responsive_builder/responsive_builder.dart';
import 'package:website/widgets/navigation_bar_item/navigation_bar_item_desktop.dart';
import 'package:website/widgets/navigation_bar_item/navigation_bar_item_mobile.dart';
import 'package:website/widgets/navigation_bar_item/navigation_bar_item_tablet.dart';
import 'package:website/extensions/hover_extensions.dart';

class NavigationBarItem extends StatelessWidget {
  final String title;
  final String routePath;
  final IconData icon;
  const NavigationBarItem(this.title, this.routePath, {this.icon});

  @override
  Widget build(BuildContext context) {
    var model = NavigationBarItemModel(
      title: title,
      routePath: routePath,
      iconData: icon,
    );
    return GestureDetector(
      onTap: () {
        if (ModalRoute.of(context)?.settings?.name != routePath) {
          ExtendedNavigator.of(context).pushNamed(routePath);
        }
      },
      child: ScreenTypeLayout.builder(
        monitorLarge: (BuildContext context) => NavigationBarItemDesktop(
          model: model,
        ).showCursorOnHover,
        tabletLarge: (BuildContext context) => OrientationLayoutBuilder(
          landscape: (context) => NavigationBarItemTablet(
            model: model,
            fontSize: 0.02,
          ),
          portrait: (context) => NavigationBarItemTablet(
            model: model,
            fontSize: 0.025,
          ),
        ),
        mobileTabletNormal: (BuildContext context) => NavigationBarItemMobile(
          model: model,
        ),
      ),
    );
  }
}

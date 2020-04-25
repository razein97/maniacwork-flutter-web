import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:website/data_models/navigation_bar_item_model.dart';
import 'package:website/extensions/hover_extensions.dart';
import 'package:website/helpers/sizes_helpers.dart';

class NavigationBarItemMobile extends StatelessWidget {
  final double fontSize;
  final NavigationBarItemModel model;
  NavigationBarItemMobile({this.model, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        height: SizeHelper.displayWidth * (fontSize + 0.07),
        child: FlatButton(
          onPressed: () {
            ExtendedNavigator.of(context).pushNamed(model.routePath);
          },
          child: Padding(
            padding: EdgeInsets.only(left: SizeHelper.displayWidth * 0.1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(model.iconData,
                    color: Colors.white,
                    size: SizeHelper.displayWidth * fontSize),
                SizedBox(
                  width: SizeHelper.displayWidth * 0.1,
                ),
                Text(
                  model.title,
                  style: TextStyle(
                      fontSize: SizeHelper.displayWidth * fontSize,
                      color: Colors.white),
                ),
              ],
            ),
          ),
        ).showCursorOnHover,
      ),
    );
  }
}

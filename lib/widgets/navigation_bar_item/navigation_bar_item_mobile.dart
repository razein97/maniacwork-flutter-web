import 'package:flutter/material.dart';
import 'package:website/data_models/navigation_bar_item_model.dart';
import 'package:website/extensions/hover_extensions.dart';
import 'package:website/helpers/sizes_helpers.dart';

class NavigationBarItemMobile extends StatelessWidget {
  final NavigationBarItemModel model;
  NavigationBarItemMobile({this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, top: 40),
      child: Row(
        children: <Widget>[
          Icon(
            model.iconData,
            color: Colors.white,
            size: displayHeight(context) * 0.03,
          ),
          SizedBox(
            width: displayWidth(context) * 0.03,
          ),
          Text(
            model.title,
            style: TextStyle(
                fontSize: displayHeight(context) * 0.025, color: Colors.white),
          ),
        ],
      ).showCursorOnHover,
    );
  }
}

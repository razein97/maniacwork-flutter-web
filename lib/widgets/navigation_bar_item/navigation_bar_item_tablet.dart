import 'package:flutter/material.dart';
import 'package:website/data_models/navigation_bar_item_model.dart';
import 'package:website/helpers/sizes_helpers.dart';

class NavigationBarItemTablet extends StatelessWidget {
  final NavigationBarItemModel model;
  final double fontSize;
  NavigationBarItemTablet({this.model, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          model.title,
          style: TextStyle(
              fontSize: displayWidth(context) * fontSize, color: Colors.white),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:website/data_models/navigation_bar_item_model.dart';
import 'package:website/extensions/hover_extensions.dart';

class NavigationBarItemDesktop extends StatelessWidget {
  final NavigationBarItemModel model;
  NavigationBarItemDesktop({this.model});

  @override
  Widget build(BuildContext context) {
    return Text(
      model.title,
      style: TextStyle(fontSize: 18.0, color: Colors.white),
    ).showCursorOnHover;
  }
}

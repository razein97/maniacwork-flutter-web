import 'package:flutter/material.dart';
import 'package:website/data_models/navigation_bar_item_model.dart';

class NavigationBarItemTablet extends StatelessWidget {
  final NavigationBarItemModel model;
  NavigationBarItemTablet({this.model});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          model.title,
          style: TextStyle(fontSize: 16.0, color: Colors.white),
        )
      ],
    );
  }
}

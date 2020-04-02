import 'package:flutter/material.dart';
import 'package:website/helpers/sizes_helpers.dart';

class WeepingEmperorMobile extends StatelessWidget {
  const WeepingEmperorMobile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            debugPrint('we tapped');
          },
          child: Container(
            width: displayWidth(context),
            height: displayHeight(context) * 0.5,
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}

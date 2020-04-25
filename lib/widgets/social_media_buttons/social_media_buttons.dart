import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:website/extensions/hover_extensions.dart';

class SocialMediaButtons extends StatelessWidget {
  final double buttonHeight;
  final double buttonWidth;
  const SocialMediaButtons({Key key, this.buttonHeight, this.buttonWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          height: buttonHeight,
          width: buttonWidth,
          child: FlatButton(
            padding: EdgeInsets.zero,
            color: Color.fromRGBO(67, 101, 173, 1.0),
            onPressed: () {},
            child: Icon(
              FontAwesomeIcons.facebook,
              color: Colors.white,
            ),
          ),
        ).showCursorOnHover,
        Container(
          height: buttonHeight,
          width: buttonWidth,
          child: FlatButton(
            padding: EdgeInsets.zero,
            color: Colors.blue,
            onPressed: () {},
            child: Icon(
              FontAwesomeIcons.twitter,
              color: Colors.white,
            ),
          ),
        ).showCursorOnHover,
        Container(
          height: buttonHeight,
          width: buttonWidth,
          child: FlatButton(
            padding: EdgeInsets.zero,
            color: Colors.grey,
            onPressed: () {},
            child: Icon(
              FontAwesomeIcons.shareAlt,
              color: Colors.white,
            ),
          ),
        ).showCursorOnHover,
      ],
    );
  }
}

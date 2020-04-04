import 'package:flutter/material.dart';
import 'package:website/constants/constants.dart';

class MyPopUpMenu extends StatefulWidget {
  final Function changeStream;
  final AssetImage iconAssetImage;

  MyPopUpMenu({@required this.changeStream, @required this.iconAssetImage});

  @override
  _MyPopUpMenuState createState() => _MyPopUpMenuState();
}

class _MyPopUpMenuState extends State<MyPopUpMenu> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      padding: EdgeInsets.zero,
      icon: ImageIcon(widget.iconAssetImage, color: Colors.black, size: 24),
      tooltip: 'Resolution',
      // offset: Offset(10.0, -500),
      onSelected: choiceAction,

      itemBuilder: (BuildContext context) {
        return Constants.choices.map((String choice) {
          return PopupMenuItem(
            value: choice,
            child: Text(choice),
          );
        }).toList();
      },
    );
  }

  void choiceAction(String choice) {
    setState(() {
      if (choice == Constants.r1080p) {
        //iconAssetImage = AssetImage('assets/icons/1080p_24px.png');
        widget.changeStream(Constants.path1080);
      } else if (choice == Constants.r720p) {
        //iconAssetImage = AssetImage('assets/icons/720p_24px.png');
        widget.changeStream(Constants.path720);
      } else if (choice == Constants.r480p) {
        //iconAssetImage = AssetImage('assets/icons/480p_24px.png');
        widget.changeStream(Constants.path480);
      }
    });
  }
}

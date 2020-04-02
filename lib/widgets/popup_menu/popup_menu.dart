import 'package:flutter/material.dart';
import 'package:website/constants/constants.dart';

class MyPopUpMenu extends StatefulWidget {
  @override
  _MyPopUpMenuState createState() => _MyPopUpMenuState();
}

class _MyPopUpMenuState extends State<MyPopUpMenu> {
  AssetImage iconAssetImage = AssetImage('assets/icons/480p_24px.png');
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      padding: EdgeInsets.zero,
      icon: ImageIcon(iconAssetImage, color: Colors.black, size: 24),
      tooltip: 'Settings',
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
    if (choice == Constants.R1080p) {
      iconAssetImage = AssetImage('assets/icons/1080p_24px.png');
    } else if (choice == Constants.R720p) {
      iconAssetImage = AssetImage('assets/icons/720p_24px.png');
    }
  }
}

import 'package:flutter/material.dart';
import 'package:website/constants/constants.dart';

class MyDropDownMenu extends StatelessWidget {
  final Function changeStream;
  final String videoQualityText;
  final List<String> videoSources;
  final Function switchStatePopupMenu;
  MyDropDownMenu(
      {this.changeStream,
      this.videoQualityText,
      this.videoSources,
      this.switchStatePopupMenu});

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: videoQualityText,
      onChanged: choiceAction,
      items: VideoConstants.resolutionText.map((String choice) {
        return DropdownMenuItem(
          value: choice,
          child: Text(
            choice,
            style: TextStyle(color: Colors.white),
          ),
        );
      }).toList(),
    );

    // PopupMenuButton(
    //   padding: EdgeInsets.zero,
    //   color: Colors.black87,
    //   child: Container(
    //     child: Center(
    //       child: Text(
    //         videoQualityText,
    //         style: TextStyle(color: Colors.white),
    //       ),
    //     ),
    //   ),
    //   tooltip: 'Resolution',
    //   onSelected: choiceAction,
    //   onCanceled: switchStatePopupMenu,
    //   itemBuilder: (BuildContext context) {
    //     return VideoConstants.resolutionText.map((String choice) {
    //       return PopupMenuItem(
    //         value: choice,
    //         child: Text(
    //           choice,
    //           style: TextStyle(color: Colors.white),
    //         ),
    //       );
    //     }).toList();
    //   },
    // );
  }

  void choiceAction(String choice) {
    if (choice == VideoConstants.r1080) {
      changeStream(videoSources[0]);
      switchStatePopupMenu();
    } else if (choice == VideoConstants.r720) {
      changeStream(videoSources[1]);
      switchStatePopupMenu();
    } else if (choice == VideoConstants.r480) {
      changeStream(videoSources[2]);
      switchStatePopupMenu();
    }
  }
}

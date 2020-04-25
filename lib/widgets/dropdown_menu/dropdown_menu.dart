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
      items: VideoPlayerConstants.resolutionText.map((String choice) {
        return DropdownMenuItem(
          value: choice,
          child: Text(
            choice,
            style: TextStyle(color: Colors.white),
          ),
        );
      }).toList(),
    );
  }

  void choiceAction(String choice) {
    if (choice == VideoPlayerConstants.r1080) {
      changeStream(videoSources[0]);
      switchStatePopupMenu();
    } else if (choice == VideoPlayerConstants.r720) {
      changeStream(videoSources[1]);
      switchStatePopupMenu();
    } else if (choice == VideoPlayerConstants.r480) {
      changeStream(videoSources[2]);
      switchStatePopupMenu();
    }
  }
}

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:website/helpers/sizes_helpers.dart';
import 'package:website/widgets/popup_menu/popup_menu.dart';
import 'package:website/widgets/video_player/slider_theme.dart';

class VideoPlayerControlsDesktop extends StatelessWidget {
  final int playBackTime;
  final VideoPlayerController controller;
  final Function play;
  final playIcon;
  final Function changeVolIcon;
  final Function changeStream;
  final popupMenuIcon;
  final Function fullScreen;

  const VideoPlayerControlsDesktop(
      {this.playBackTime,
      this.controller,
      this.play,
      this.playIcon,
      this.changeVolIcon,
      this.changeStream,
      this.popupMenuIcon,
      this.fullScreen});

  @override
  Widget build(BuildContext context) {
    double centeredViewWidth = 1500;
    double sliderRatio;
    double newCurrentVolume;
    format(Duration d) => d.toString().split('.').first.padLeft(8, "0");

    return Align(
      alignment: AlignmentDirectional.bottomCenter,
      child: Container(
        color: Colors.yellowAccent,
        height: displayHeight(context) * 0.05,
        width: centeredViewWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              width: displayWidth(context) * sliderRatio,
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 10,
              child: MySliderTheme(
                context: context,
                slider: Slider(
                  value: playBackTime.toDouble(),
                  min: 0,
                  max: controller.value.duration.inSeconds.toDouble(),
                  onChanged: (double newPosition) {
                    controller.seekTo(
                      Duration(
                        seconds: newPosition.toInt(),
                      ),
                    );
                  },
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  //First Row
                  Row(
                    children: <Widget>[
                      //Play Button
                      Container(
                        width: centeredViewWidth * 0.03,
                        child: GestureDetector(
                          onTap: () => play(),
                          child: Icon(
                            playIcon,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      //Skip Seconds Button
                      Container(
                        width: centeredViewWidth * 0.03,
                        child: GestureDetector(
                          onTap: () => controller.seekTo(
                              controller.value.position +
                                  Duration(seconds: 10)),
                          child: Icon(
                            Icons.skip_next,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      //Volume Button and Slider
                      Row(
                        children: <Widget>[
                          Container(
                            width: centeredViewWidth,
                            child: GestureDetector(
                              onTap: () {
                                if (controller.value.volume > 0) {
                                  newCurrentVolume = controller.value.volume;
                                  controller.setVolume(0);
                                } else {
                                  controller.setVolume(newCurrentVolume);
                                }
                              },
                              child: Icon(
                                changeVolIcon(),
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Container(
                            width: centeredViewWidth * 0.05,
                            child: MySliderTheme(
                              context: context,
                              slider: Slider(
                                value: controller.value.volume,
                                min: 0,
                                max: 1,
                                onChanged: (double newVolume) {
                                  controller.setVolume(newVolume);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  //Second Row
                  Row(
                    children: <Widget>[
                      //Current Playback Position and Duration
                      Container(
                        child: Text(
                          format(controller.value.position).toString(),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Text('/'),
                      ),
                      Container(
                        child: Text(
                          format(controller.value.duration).toString(),
                        ),
                      ),
                    ],
                  ),

                  //Third Row
                  Row(
                    children: <Widget>[
                      //Pop Up Menu with Resolution Switcher
                      Container(
                        width: centeredViewWidth * 0.03,
                        child: MyPopUpMenu(
                          changeStream: changeStream,
                        ),
                      ),
                      //Button to Go Full Screen
                      Container(
                        width: centeredViewWidth * 0.03,
                        child: GestureDetector(
                          onTap: () {
                            fullScreen();
                          },
                          child: Icon(Icons.fullscreen),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

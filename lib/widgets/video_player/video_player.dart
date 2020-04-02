import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:website/helpers/sizes_helpers.dart';
import 'package:website/widgets/popup_menu/popup_menu.dart';
import 'package:website/widgets/video_player/slider_theme.dart';

class VideoPlayerWeb extends StatefulWidget {
  final String videoPath;
  VideoPlayerWeb(this.videoPath);

  @override
  _VideoPlayerWebState createState() => _VideoPlayerWebState();
}

class _VideoPlayerWebState extends State<VideoPlayerWeb> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;
  VoidCallback listener;
  int _playBackTime;
  double centeredViewWidth = 1500;

  IconData playIcon = Icons.play_arrow;

  @override
  void initState() {
    _controller = VideoPlayerController.network(widget.videoPath)
      ..addListener(() {
        setState(() {
          _playBackTime = _controller.value.position.inSeconds;
        });
      });
    _initializeVideoPlayerFuture = _controller.initialize();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(
              children: <Widget>[
                Center(
                  child: AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: (_controller != null
                        ? VideoPlayer(
                            _controller,
                          )
                        : Container()),
                  ),
                ),
                GestureDetector(onTap: () {
                  play();
                }),
                Align(
                  alignment: AlignmentDirectional.bottomCenter,
                  child: Container(
                    color: Colors.yellowAccent,
                    height: 35,
                    width: centeredViewWidth,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
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
                        Container(
                          width: displayWidth(context) <= 1050 &&
                                  displayWidth(context) > 950
                              ? displayWidth(context) * 0.5
                              : displayWidth(context) * 0.6,
                          child: MySliderTheme(
                            context: context,
                            slider: Slider(
                              value: _playBackTime.toDouble(),
                              min: 0,
                              max: _controller.value.duration.inSeconds
                                  .toDouble(),
                              onChanged: (double newPosition) {
                                _controller.seekTo(
                                  Duration(
                                    seconds: newPosition.toInt(),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        Container(
                          width: centeredViewWidth * 0.03,
                          child: GestureDetector(
                            onTap: () {},
                            child: Icon(
                              Icons.volume_up,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          width: centeredViewWidth * 0.09,
                          child: MySliderTheme(
                            context: context,
                            slider: Slider(
                              value: _controller.value.volume,
                              min: 0,
                              max: 1,
                              onChanged: (double newVolume) {
                                setState(() {
                                  _controller.setVolume(newVolume);
                                });
                              },
                            ),
                          ),
                        ),
                        Container(
                            width: centeredViewWidth * 0.03,
                            child: MyPopUpMenu()),
                        Container(
                          width: centeredViewWidth * 0.03,
                          child: GestureDetector(
                            onTap: () {},
                            child: Icon(Icons.fullscreen),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.grey,
              ),
            );
          }
        });
  }

  void play() {
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
        playIcon = Icons.pause;
      } else {
        _controller.play();
        playIcon = Icons.play_arrow;
      }
    });
  }
}

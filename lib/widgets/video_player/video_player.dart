import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:website/constants/constants.dart';
import 'package:website/helpers/sizes_helpers.dart';
import 'package:website/widgets/popup_menu/popup_menu.dart';
import 'package:website/widgets/video_player/slider_theme.dart';
import 'package:website/widgets/video_player/video_player_config.dart';

class VideoPlayerWeb extends StatefulWidget {
  final String deviceType;
  final List<String> videoSources;

  VideoPlayerWeb({this.deviceType, this.videoSources});
  @override
  _VideoPlayerWebState createState() => _VideoPlayerWebState();
}

class _VideoPlayerWebState extends State<VideoPlayerWeb> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;
  VoidCallback listener;
  int _playBackTime;
  int _maxDuration;
  double centeredViewWidth = 1500;

  String videoQualityText = VideoConstants.r1080;
  String currentVideoPath;

  //The values that are passed when changing quality
  Duration newCurrentPosition;
  double newCurrentVolume;

  IconData playIcon = Icons.play_arrow;

  double sliderRatio;
  double volumeRatio;

  bool showControls = true;
  bool _isBuffering;
  bool fullScreen = true;
  bool popupMenuIsOpen = false;

  format(Duration d) {
    return d.toString().split('.').first.replaceAllMapped(
        RegExp(r'^0(?:0:0?)?:', caseSensitive: false), (Match m) => '');
  }

  @override
  void initState() {
    _controller = VideoPlayerController.network(widget.videoSources[0]);
    _controller.addListener(() {
      setState(() {
        _playBackTime = _controller.value.position.inSeconds;
        _maxDuration = _controller.value.duration.inSeconds;
        debugPrint(_controller.value.isBuffering.toString());
      });
    });
    _initializeVideoPlayerFuture = _controller.initialize();

    getConfigValues(widget.deviceType);
    currentVideoPath = widget.videoSources[0];

    super.initState();
  }

  @override
  void dispose() {
    // _disposed = true;
    _initializeVideoPlayerFuture = null;
    _controller?.pause()?.then((_) {
      _controller.dispose();
    });
    super.dispose();
  }

  Future<bool> _clearPrevious() async {
    await _controller?.pause();
    _controller?.removeListener(() {});
    _initializeVideoPlayerFuture = null;
    return true;
  }

  void _getValuesAndPlay(String videoPath) {
    newCurrentPosition = _controller.value.position;
    newCurrentVolume = _controller.value.volume;

    _startPlay(videoPath);
    print(newCurrentPosition.toString());
  }

  Future<void> _startPlay(String videoPath) async {
    Future.delayed(const Duration(milliseconds: 200), () {
      _clearPrevious().then((_) {
        _initializePlay(videoPath);
      });
    });
  }

  Future<void> _initializePlay(String videoPath) async {
    _controller = VideoPlayerController.network(videoPath);
    _controller.addListener(() {
      setState(() {
        _playBackTime = _controller.value.position.inSeconds;
        _maxDuration = _controller.value.duration.inSeconds;
      });
    });
    _initializeVideoPlayerFuture = _controller.initialize().then((_) {
      _controller.setVolume(newCurrentVolume);
      _controller.seekTo(newCurrentPosition);
      _controller.play();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return MouseRegion(
              onHover: (event) {
                setState(
                  () {
                    showControls = true;
                    if (_controller.value.isPlaying) {
                      Future.delayed(const Duration(seconds: 2),
                          () => showControls = false);
                    }
                  },
                );
              },
              onExit: (event) {
                if (!_controller.value.isPlaying) {
                  setState(() {
                    showControls = true;
                  });
                } else {
                  setState(() {
                    showControls = false;
                  });
                }
              },
              child: Container(
                child: Stack(
                  children: <Widget>[
                    Center(
                      child: AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        showControls = true;
                        if (_controller.value.isPlaying) {
                          Future.delayed(const Duration(seconds: 2),
                              () => showControls = false);
                        }
                      },
                    ),
                    Visibility(
                      visible: showControls,
                      child: Center(
                        child: FloatingActionButton(
                            foregroundColor: Colors.white,
                            backgroundColor: Color.fromRGBO(16, 179, 249, 0.8),
                            hoverColor: Colors.blue,
                            focusColor: Colors.blue,
                            child: Icon(
                              playIcon,
                            ),
                            onPressed: () {
                              play();
                            }),
                      ),
                    ),
                    //TODO: Add this when flutter team fixes bug
                    Visibility(
                      visible: false,
                      child: Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.grey,
                        ),
                      ),
                    ),
                    Visibility(
                      visible: showControls,
                      maintainAnimation: true,
                      maintainInteractivity: true,
                      maintainSize: true,
                      maintainState: true,
                      child: Align(
                        alignment: AlignmentDirectional.bottomCenter,
                        child: Container(
                          color: Colors.black87,
                          height: displayHeight(context) * 0.05,
                          width: centeredViewWidth,
                          child: widget.deviceType == 'desktop'
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Container(
                                      width:
                                          displayWidth(context) * sliderRatio,
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 20),
                                      height: 10,
                                      child: MySliderTheme(
                                        context: context,
                                        slider: Slider(
                                          value: _playBackTime.toDouble(),
                                          min: 0,
                                          max: _maxDuration.toDouble(),
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
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
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
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                              //Skip Seconds Button
                                              Container(
                                                width: centeredViewWidth * 0.03,
                                                child: GestureDetector(
                                                  onTap: () => _controller
                                                      .seekTo(_controller
                                                              .value.position +
                                                          Duration(
                                                              seconds: 10)),
                                                  child: Icon(
                                                    Icons.skip_next,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                              //Volume Button and Slider
                                              Row(
                                                children: <Widget>[
                                                  Container(
                                                    width: centeredViewWidth *
                                                        volumeRatio,
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        if (_controller
                                                                .value.volume >
                                                            0) {
                                                          newCurrentVolume =
                                                              _controller
                                                                  .value.volume;
                                                          _controller
                                                              .setVolume(0);
                                                        } else {
                                                          _controller.setVolume(
                                                              newCurrentVolume);
                                                        }
                                                      },
                                                      child: Icon(
                                                        changeVolIcon(),
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: centeredViewWidth *
                                                        0.05,
                                                    child: MySliderTheme(
                                                      context: context,
                                                      slider: Slider(
                                                        value: _controller
                                                            .value.volume,
                                                        min: 0,
                                                        max: 1,
                                                        onChanged:
                                                            (double newVolume) {
                                                          _controller.setVolume(
                                                              newVolume);
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
                                                  format(_controller
                                                          .value.position)
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 5),
                                                child: Text(
                                                  '/',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                              Container(
                                                child: Text(
                                                  format(_controller
                                                          .value.duration)
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: Colors.white),
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
                                                  videoQualityText:
                                                      videoQualityText,
                                                  videoSources:
                                                      widget.videoSources,
                                                  switchStatePopupMenu:
                                                      isPopupMenuOpen,
                                                ),
                                              ),
                                              //Button to Go Full Screen
                                              Container(
                                                width: centeredViewWidth * 0.03,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    gofullScreen();
                                                    fullScreen = !fullScreen;
                                                  },
                                                  child: Icon(
                                                    fullScreen
                                                        ? Icons.fullscreen
                                                        : Icons.fullscreen_exit,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Container(
                                      child: Text(
                                        format(_controller.value.position)
                                            .toString(),
                                        textScaleFactor: 1,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    Container(
                                      width: displayWidth(context) *
                                          VideoConfig.mobileSliderRatio,
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      height: 10,
                                      child: MySliderTheme(
                                        context: context,
                                        slider: Slider(
                                          value: _playBackTime.toDouble(),
                                          min: 0,
                                          max: _maxDuration.toDouble(),
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
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        //Pop Up Menu with Resolution Switcher
                                        Container(
                                          child: MyPopUpMenu(
                                            changeStream: changeStream,
                                            videoQualityText: videoQualityText,
                                            videoSources: widget.videoSources,
                                            switchStatePopupMenu:
                                                isPopupMenuOpen,
                                          ),
                                        ),
                                        //Button to Go Full Screen
                                        Container(
                                          width: displayWidth(context) * 0.10,
                                          child: GestureDetector(
                                            onTap: () {
                                              gofullScreen();
                                              fullScreen = !fullScreen;
                                            },
                                            child: Icon(
                                              fullScreen
                                                  ? Icons.fullscreen
                                                  : Icons.fullscreen_exit,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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

  void gofullScreen() {}

  void isPopupMenuOpen() {
    popupMenuIsOpen = !popupMenuIsOpen;
  }

  void getConfigValues(String devType) {
    if (devType == 'desktop') {
      sliderRatio = VideoConfig.desktopSliderRatio;
      volumeRatio = VideoConfig.desktopVolumeRatio;
    } else if (devType == 'mobile') {
      sliderRatio = VideoConfig.mobileSliderRatio;
      volumeRatio = VideoConfig.mobileVolumeRatio;
    }
  }

  void play() {
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
        playIcon = Icons.play_arrow;
        showControls = true;
      } else {
        _controller.play();
        playIcon = Icons.pause;
        showControls = false;
      }
    });
  }

  IconData changeVolIcon() {
    if (_controller.value.volume > 0.5) {
      return Icons.volume_up;
    } else if (_controller.value.volume > 0.01 &&
        _controller.value.volume < 0.49) {
      return Icons.volume_down;
    } else {
      return Icons.volume_mute;
    }
  }

  void changeStream(String videoPath) {
    setState(() {
      if (videoPath != currentVideoPath) {
        if (videoPath == widget.videoSources[0]) {
          _getValuesAndPlay(videoPath);
          videoQualityText = VideoConstants.r1080;
          currentVideoPath = videoPath;
        } else if (videoPath == widget.videoSources[1]) {
          _getValuesAndPlay(videoPath);
          videoQualityText = VideoConstants.r720;
          currentVideoPath = videoPath;
        } else if (videoPath == widget.videoSources[2]) {
          _getValuesAndPlay(videoPath);
          videoQualityText = VideoConstants.r480;
          currentVideoPath = videoPath;
        } else {
          print('You got something wrong');
        }
      }
    });
  }
}

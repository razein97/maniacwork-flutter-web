import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:website/constants/constants.dart';
import 'package:website/helpers/sizes_helpers.dart';
import 'package:website/widgets/popup_menu/popup_menu.dart';
import 'package:website/widgets/video_player/slider_theme.dart';

class VideoPlayerWeb extends StatefulWidget {
  @override
  _VideoPlayerWebState createState() => _VideoPlayerWebState();
}

class _VideoPlayerWebState extends State<VideoPlayerWeb> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;
  VoidCallback listener;
  int _playBackTime;
  double centeredViewWidth = 1500;

  final String videoPath1080p = Constants.path1080;
  AssetImage popuMenuIcon = AssetImage('assets/icons/1080p_24px.png');

  //The values that are passed when changing quality
  Duration newCurrentPosition;
  double newCurrentVolume;
  //bool _disposed = false;

  IconData playIcon = Icons.play_arrow;

  format(Duration d) => d.toString().split('.').first.padLeft(8, "0");

  @override
  void initState() {
    _controller = VideoPlayerController.network(videoPath1080p);
    _controller.addListener(() {
      setState(() {
        _playBackTime = _controller.value.position.inSeconds;
      });
    });
    _initializeVideoPlayerFuture = _controller.initialize();
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
    //_controller?.removeListener(_controllerListener);
    return true;
  }

  Future<void> _initializePlay(String videoPath) async {
    _controller = VideoPlayerController.network(videoPath);
    _controller.addListener(() {
      setState(() {
        _playBackTime = _controller.value.position.inSeconds;
      });
    });
    _initializeVideoPlayerFuture = _controller.initialize().then((_) {
      _controller.setVolume(newCurrentVolume);
      _controller.seekTo(newCurrentPosition);
      _controller.play();
    });
  }

  void _getValuesAndPlay(String videoPath) {
    newCurrentPosition = _controller.value.position;
    newCurrentVolume = _controller.value.volume;
    _startPlay(videoPath);
    print(newCurrentPosition.toString());
  }

  Future<void> _startPlay(String videoPath) async {
    setState(() {
      _initializeVideoPlayerFuture = null;
    });
    Future.delayed(const Duration(milliseconds: 200), () {
      _clearPrevious().then((_) {
        _initializePlay(videoPath);
      });
    });
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
                          width: centeredViewWidth * 0.05,
                          child: Center(
                            child: Text(
                              format(_controller.value.position).toString(),
                            ),
                          ),
                        ),
                        Container(
                          width: centeredViewWidth * 0.02,
                          child: GestureDetector(
                            onTap: () {
                              if (_controller.value.volume != 0) {
                                newCurrentVolume = _controller.value.volume;
                                _controller.setVolume(0);
                              } else {
                                _controller.setVolume(newCurrentVolume);
                              }
                            },
                            child: Icon(
                              Icons.volume_up,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          width: centeredViewWidth * 0.05,
                          child: MySliderTheme(
                            context: context,
                            slider: Slider(
                              value: _controller.value.volume,
                              min: 0,
                              max: 1,
                              onChanged: (double newVolume) {
                                _controller.setVolume(newVolume);
                              },
                            ),
                          ),
                        ),
                        Container(
                            width: centeredViewWidth * 0.03,
                            child: MyPopUpMenu(
                              changeStream: changeStream,
                              iconAssetImage: popuMenuIcon,
                            )),
                        Container(
                          width: centeredViewWidth * 0.03,
                          child: GestureDetector(
                            onTap: () {
                              showPopup(context);
                            },
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

  Future<bool> showPopup(context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
              insetPadding: EdgeInsets.all(0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.black,
                child: Row(
                  children: <Widget>[
                    Container(
                      // width: 100,
                      // height: 100,
                      child: FlatButton(
                        color: Colors.white,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.clear),
                      ),
                    ),
                  ],
                ),
              ));
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

  void changeStream(String videoPath) {
    if (videoPath == Constants.path1080) {
      popuMenuIcon = AssetImage('assets/icons/1080p_24px.png');
      _getValuesAndPlay(videoPath);
    } else if (videoPath == Constants.path720) {
      popuMenuIcon = AssetImage('assets/icons/720p_24px.png');
      _getValuesAndPlay(videoPath);
    } else if (videoPath == Constants.path480) {
      popuMenuIcon = AssetImage('assets/icons/480p_24px.png');
      _getValuesAndPlay(videoPath);
    } else {
      print('You got something wrong');
    }
  }
}

import 'package:flutter/material.dart';
import 'package:website/constants/constants.dart';
import 'package:website/helpers/sizes_helpers.dart';
import 'package:website/widgets/centered_view/centered_view.dart';
import 'package:website/widgets/navigation_bar/navigation_bar.dart';
import 'package:website/widgets/video_player/video_player.dart';

class WeepingEmperorTablet extends StatefulWidget {
  WeepingEmperorTablet({Key key}) : super(key: key);

  @override
  _WeepingEmperorTabletState createState() => _WeepingEmperorTabletState();
}

class _WeepingEmperorTabletState extends State<WeepingEmperorTablet> {
  double _hPadding = 0;
  double _heightRatio = 0.5;
  double _maxWidth = 1500;
  double _maxHeight = 2000;
  bool appBar = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar
          ? PreferredSize(
              preferredSize: Size(double.infinity, 100),
              child: NavigationBar(),
            )
          : null,
      body: CenteredView(
        hPadding: _hPadding,
        maxHeight: _maxHeight,
        maxWidth: _maxWidth,
        child: ListView(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                debugPrint('we tapped');
              },
              child: Container(
                width: displayWidth(context),
                height: displayHeight(context) * _heightRatio,
                child: VideoPlayerWeb(
                  fullScreen: goFullScreen,
                  deviceType: 'tablet',
                  videoSources: VideoConstants.weepingEmperorSrc,
                ),
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void goFullScreen() {
    setState(() {
      if (_heightRatio == 0.5) {
        _heightRatio = 1;
        _maxWidth = displayWidth(context);
        _maxHeight = displayHeight(context);
        appBar = false;
      } else {
        _heightRatio = 0.5;
        _maxWidth = 1500;
        _maxHeight = 2000;
        appBar = true;
      }
    });
  }
}

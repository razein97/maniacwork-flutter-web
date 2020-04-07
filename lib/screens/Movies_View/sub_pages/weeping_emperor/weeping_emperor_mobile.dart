import 'package:flutter/material.dart';
import 'package:website/helpers/sizes_helpers.dart';
import 'package:website/widgets/centered_view/centered_view.dart';
import 'package:website/widgets/video_player/video_player.dart';

class WeepingEmperorMobile extends StatefulWidget {
  WeepingEmperorMobile({Key key}) : super(key: key);

  @override
  _WeepingEmperorMobileState createState() => _WeepingEmperorMobileState();
}

class _WeepingEmperorMobileState extends State<WeepingEmperorMobile> {
  double _hPadding = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CenteredView(
        hPadding: _hPadding,
        child: ListView(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                debugPrint('we tapped');
              },
              child: Container(
                width: displayWidth(context),
                height: displayHeight(context) * 0.5,
                child: VideoPlayerWeb(),
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

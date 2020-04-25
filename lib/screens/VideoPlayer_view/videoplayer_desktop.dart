import 'package:flutter/material.dart';
import 'package:website/helpers/sizes_helpers.dart';
import 'package:website/widgets/video_player/video_player.dart';

class VideoPlayerDesktop extends StatelessWidget {
  final List<String> videoSources;
  const VideoPlayerDesktop({Key key, this.videoSources}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        width: SizeHelper.displayWidth,
        height: SizeHelper.displayHeight,
        child: VideoPlayerWeb(
          deviceType: 'desktop',
          videoSources: videoSources,
        ),
      ),
    );
  }
}

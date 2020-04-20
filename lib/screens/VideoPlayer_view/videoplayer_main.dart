import 'package:flutter/material.dart';
import 'package:website/responsive_builder/responsive_builder.dart';
import 'package:website/screens/VideoPlayer_view/videoplayer_desktop.dart';
import 'package:website/screens/VideoPlayer_view/videoplayer_mob_tab.dart';

class VideoPlayerMain extends StatelessWidget {
  final List<String> videoSources;
  const VideoPlayerMain({@required this.videoSources});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobileTabletNormal: (BuildContext context) => VideoPlayerMobileTablet(
        videoSources: videoSources,
      ),
      tabletLarge: (BuildContext context) => VideoPlayerMobileTablet(
        videoSources: videoSources,
      ),
      monitorLarge: (BuildContext context) => VideoPlayerDesktop(
        videoSources: videoSources,
      ),
    );
  }
}

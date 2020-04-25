import 'package:flutter/material.dart';
import 'package:website/responsive_builder/responsive_builder.dart';
import 'package:website/screens/Movies_View/sub_pages/weeping_emperor/mobile/weeping_emperor_mob_landscape.dart';
import 'package:website/screens/Movies_View/sub_pages/weeping_emperor/mobile/weeping_emperor_mob_potrait.dart';
import 'package:website/screens/Movies_View/sub_pages/weeping_emperor/tablet/weeping_emperor_tab_landscape.dart';
import 'package:website/screens/Movies_View/sub_pages/weeping_emperor/tablet/weeping_emperor_tab_potrait.dart';
import 'package:website/screens/Movies_View/sub_pages/weeping_emperor/weeping_emperor_desktop.dart';

class WeepingEmperorMain extends StatelessWidget {
  const WeepingEmperorMain({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String filePath = 'assets/movie_info/weeping_emperor.json';
    final String posterPath =
        'assets/images/movies/weeping_emperor/6814797_landscape_1564162383.jpg';
    return ScreenTypeLayout.builder(
      mobileTabletNormal: (BuildContext context) => OrientationLayoutBuilder(
        landscape: (context) => WeepingEmperorMobileLandscape(
          filePath: filePath,
          posterPath: posterPath,
        ),
        portrait: (context) => WeepingEmperorMobilePotrait(
          filePath: filePath,
          posterPath: posterPath,
        ),
      ),
      tabletLarge: (BuildContext context) => OrientationLayoutBuilder(
        landscape: (context) => WeepingEmperorTabletLandscape(
          filePath: filePath,
          posterPath: posterPath,
        ),
        portrait: (context) => WeepingEmperorTabletPotrait(
          filePath: filePath,
          posterPath: posterPath,
        ),
      ),
      monitorLarge: (BuildContext context) => WeepingEmperorDesktop(
        filePath: filePath,
        posterPath: posterPath,
      ),
    );
  }
}

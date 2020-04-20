import 'package:flutter/material.dart';
import 'package:website/responsive_builder/responsive_builder.dart';
import 'package:website/screens/Movies_View/main/mobile/movies_content_mob_landscape.dart';
import 'package:website/screens/Movies_View/main/mobile/movies_content_mob_potrait.dart';
import 'package:website/screens/Movies_View/main/movies_content_desktop.dart';
import 'package:website/screens/Movies_View/main/tablet/movies_content_tab_landscape.dart';
import 'package:website/screens/Movies_View/main/tablet/movies_content_tab_potrait.dart';

class MoviesView extends StatelessWidget {
  const MoviesView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobileTabletNormal: (BuildContext context) => OrientationLayoutBuilder(
        landscape: (context) => MoviesContentMobileLandscape(),
        portrait: (context) => MoviesContentMobilePotrait(),
      ),
      tabletLarge: (BuildContext context) => OrientationLayoutBuilder(
        landscape: (context) => MoviesContentTabletLandscape(),
        portrait: (context) => MoviesContentTabletPotrait(),
      ),
      monitorLarge: (BuildContext context) => MoviesContentDesktop(),
    );
  }
}

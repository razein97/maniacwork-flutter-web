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
    return ScreenTypeLayout.builder(
      mobileTabletNormal: (BuildContext context) => OrientationLayoutBuilder(
        landscape: (context) => WeepingEmperorMobileLandscape(
          filePath: filePath,
        ),
        portrait: (context) => WeepingEmperorMobilePotrait(
          filePath: filePath,
        ),
      ),
      tabletLarge: (BuildContext context) => OrientationLayoutBuilder(
        landscape: (context) => WeepingEmperorTabletLandscape(
          filePath: filePath,
        ),
        portrait: (context) => WeepingEmperorTabletPotrait(
          filePath: filePath,
        ),
      ),
      monitorLarge: (BuildContext context) => WeepingEmperorDesktop(
        filePath: filePath,
      ),
    );
  }
}

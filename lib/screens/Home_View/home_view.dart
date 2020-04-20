import 'package:flutter/material.dart';
import 'package:website/helpers/size_config.dart';
import 'package:website/responsive_builder/responsive_builder.dart';
import 'package:website/screens/Home_View/home_content_desktop.dart';
import 'package:website/screens/Home_View/mobile/home_content_mob_landscape.dart';
import 'package:website/screens/Home_View/mobile/home_content_mob_potrait.dart';
import 'package:website/screens/Home_View/tablet/home_content_tab_landscape.dart';
import 'package:website/screens/Home_View/tablet/home_content_tab_potrait.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: ScreenTypeLayout.builder(
        mobileTabletNormal: (BuildContext context) => OrientationLayoutBuilder(
          landscape: (context) => HomeContentMobileLandscape(),
          portrait: (context) => HomeContentMobilePotrait(),
        ),
        tabletLarge: (BuildContext context) => OrientationLayoutBuilder(
          landscape: (context) => HomeContentTabletLandscape(),
          portrait: (context) => HomeContentTabletPotrait(),
        ),
        monitorLarge: (BuildContext context) => HomeContentDesktop(),
      ),
    );
  }
}

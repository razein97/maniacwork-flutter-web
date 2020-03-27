import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:website/screens/Home_View/home_content_desktop.dart';
import 'package:website/screens/Home_View/home_content_mobile.dart';
import 'package:website/screens/Home_View/home_content_tablet.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => HomeContentMobile(),
      tablet: (BuildContext context) => HomeContentTablet(),
      desktop: (BuildContext context) => HomeContentDesktop(),
    );
  }
}

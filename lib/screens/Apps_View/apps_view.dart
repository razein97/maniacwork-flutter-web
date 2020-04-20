import 'package:flutter/material.dart';
import 'package:website/responsive_builder/responsive_builder.dart';
import 'package:website/screens/Apps_View/apps_content_desktop.dart';
import 'package:website/screens/Apps_View/apps_content_mobile.dart';
import 'package:website/screens/Apps_View/apps_content_tablet.dart';

class AppsView extends StatelessWidget {
  const AppsView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobileTabletNormal: (BuildContext context) => AppsContentMobile(),
      tabletLarge: (BuildContext context) => AppsContentTablet(),
      monitorLarge: (BuildContext context) => AppsContentDesktop(),
    );
  }
}

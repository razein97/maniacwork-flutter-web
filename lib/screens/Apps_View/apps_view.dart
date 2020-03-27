import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:website/screens/Apps_View/apps_content_desktop.dart';
import 'package:website/screens/Apps_View/apps_content_mobile.dart';
import 'package:website/screens/Apps_View/apps_content_tablet.dart';

class AppsView extends StatelessWidget {
  const AppsView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => AppsContentMobile(),
      tablet: (BuildContext context) => AppsContentTablet(),
      desktop: (BuildContext context) => AppsContentDesktop(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:website/screens/Movies_View/sub_pages/weeping_emperor/weeping_emperor_desktop.dart';
import 'package:website/screens/Movies_View/sub_pages/weeping_emperor/weeping_emperor_mobile.dart';
import 'package:website/screens/Movies_View/sub_pages/weeping_emperor/weeping_emperor_tablet.dart';

class WeepingEmperorMain extends StatelessWidget {
  const WeepingEmperorMain({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => PreferredSize(
        preferredSize: Size(double.infinity, 100),
        child: WeepingEmperorMobile(),
      ),
      tablet: (BuildContext context) => WeepingEmperorTablet(),
      desktop: (BuildContext context) => WeepingEmperorDesktop(),
    );
  }
}

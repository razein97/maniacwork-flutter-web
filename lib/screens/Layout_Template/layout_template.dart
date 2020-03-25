import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:website/screens/Home_View/home_view.dart';
import 'package:website/widgets/navigation_bar/navigation_bar.dart';
import 'package:website/widgets/navigation_drawer/navigation_drawer.dart';

class LayoutTemplate extends StatelessWidget {
  const LayoutTemplate({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Scaffold(
        drawer: sizingInformation.deviceScreenType == DeviceScreenType.Mobile
            ? NavigationDrawer()
            : null,
        backgroundColor: Colors.blueGrey,
        body: Column(
          children: <Widget>[
            NavigationBar(),
            Expanded(child: HomeView()),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:website/helpers/sizes_helpers.dart';
import 'package:website/widgets/carousel/carousel.dart';
import 'package:website/widgets/navigation_bar/navigation_bar.dart';
import 'package:website/widgets/navigation_drawer/navigation_drawer.dart';

class HomeContentMobileLandscape extends StatelessWidget {
  const HomeContentMobileLandscape({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 100),
        child: NavigationBar(),
      ),
      body: Container(
          width: displayWidth(context),
          color: Colors.blue,
          child: ListView(
            children: <Widget>[
              Carousel(
                centerPageEnlarge: false,
                viewportFraction: 0.95,
                aspectRatio: 16 / 9,
                height: displayHeight(context) * 0.8,
              ),
            ],
          )),
    );
  }
}

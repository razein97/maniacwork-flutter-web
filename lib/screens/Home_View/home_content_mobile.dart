import 'package:flutter/material.dart';
import 'package:website/helpers/sizes_helpers.dart';
import 'package:website/widgets/carousel/carousel.dart';
import 'package:website/widgets/navigation_bar/navigation_bar.dart';
import 'package:website/widgets/navigation_drawer/navigation_drawer.dart';

class HomeContentMobile extends StatelessWidget {
  const HomeContentMobile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      body: Container(
          width: displayWidth(context),
          color: Colors.red,
          child: Column(
            children: <Widget>[
              NavigationBar(),
              Carousel(
                centerPageEnlarge: false,
                viewportFraction: 0.95,
                aspectRatio: 16 / 10,
                height: displayHeight(context) * 0.4,
              ),
            ],
          )),
    );
  }
}

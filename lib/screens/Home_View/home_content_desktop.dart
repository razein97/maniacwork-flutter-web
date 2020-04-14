import 'package:flutter/material.dart';
import 'package:website/helpers/sizes_helpers.dart';
import 'package:website/widgets/carousel/carousel.dart';
import 'package:website/widgets/navigation_bar/navigation_bar.dart';

class HomeContentDesktop extends StatelessWidget {
  const HomeContentDesktop({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 100),
        child: NavigationBar(),
      ),
      body: Container(
        width: displayWidth(context),
        color: Colors.red,
        child: ListView(
          children: <Widget>[
            Carousel(
              centerPageEnlarge: true,
              viewportFraction: 0.9,
              aspectRatio: 16 / 10,
              height: displayHeight(context) * 0.8,
            ),
          ],
        ),
      ),
    );
  }
}

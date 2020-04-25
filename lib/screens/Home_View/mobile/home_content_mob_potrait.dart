import 'package:flutter/material.dart';
import 'package:website/helpers/sizes_helpers.dart';
import 'package:website/widgets/carousel/carousel.dart';
import 'package:website/widgets/footer/footer.dart';
import 'package:website/widgets/navigation_bar/navigation_bar.dart';
import 'package:website/widgets/navigation_drawer/navigation_drawer.dart';

class HomeContentMobilePotrait extends StatelessWidget {
  const HomeContentMobilePotrait({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 100),
        child: NavigationBar(),
      ),
      body: Container(
          width: SizeHelper.displayWidth,
          child: ListView(
            children: <Widget>[
              Carousel(
                centerPageEnlarge: false,
                viewportFraction: 0.95,
                aspectRatio: 16 / 10,
                height: SizeHelper.displayHeight * 0.4,
              ),
              Footer(
                footerHeight: 0.07,
              ),
            ],
          )),
    );
  }
}

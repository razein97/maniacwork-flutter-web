import 'package:flutter/material.dart';
import 'package:website/constants/constants.dart';
import 'package:website/helpers/sizes_helpers.dart';
import 'package:website/widgets/carousel/carousel.dart';
import 'package:website/widgets/footer/footer.dart';
import 'package:website/widgets/navigation_bar/navigation_bar.dart';

class HomeContentTabletLandscape extends StatelessWidget {
  const HomeContentTabletLandscape({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 100),
        child: NavigationBar(),
      ),
      body: Container(
          width: SizeHelper.displayWidth,
          child: ListView(
            children: <Widget>[
              Carousel(
                centerPageEnlarge: true,
                viewportFraction: 0.9,
                aspectRatio: 16 / 10,
                height: SizeHelper.displayHeight * 0.8,
              ),
              Footer(
                footerHeight: FooterConstants.footerHeightTablet,
              ),
            ],
          )),
    );
  }
}

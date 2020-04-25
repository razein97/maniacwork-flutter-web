import 'package:flutter/material.dart';
import 'package:website/constants/constants.dart';
import 'package:website/helpers/sizes_helpers.dart';
import 'package:website/widgets/carousel/carousel.dart';
import 'package:website/widgets/centered_view/centered_view.dart';
import 'package:website/widgets/footer/footer.dart';
import 'package:website/widgets/navigation_bar/navigation_bar.dart';

class HomeContentDesktop extends StatelessWidget {
  final double centeredViewMaxWidth;
  const HomeContentDesktop({Key key, this.centeredViewMaxWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 100),
        child: NavigationBar(),
      ),
      body: Container(
        width: SizeHelper.displayWidth,
        child: CenteredView(
          hPadding: 0,
          vPadding: 0,
          maxWidth: SizeHelper.displayWidth * centeredViewMaxWidth,
          maxHeight: SizeHelper.displayHeight,
          child: ListView(
            children: <Widget>[
              Carousel(
                centerPageEnlarge: false,
                viewportFraction: 1,
                aspectRatio: 16 / 10,
                height: SizeHelper.displayHeight * 0.7,
              ),
              Footer(
                footerHeight: FooterConstants.footerHeightDesktop,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

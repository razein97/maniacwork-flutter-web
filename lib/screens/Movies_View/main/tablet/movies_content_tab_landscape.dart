import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:website/constants/constants.dart';
import 'package:website/helpers/sizes_helpers.dart';
import 'package:website/routing/router.gr.dart';
import 'package:website/widgets/footer/footer.dart';
import 'package:website/widgets/navigation_bar/navigation_bar.dart';

class MoviesContentTabletLandscape extends StatelessWidget {
  const MoviesContentTabletLandscape({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 100),
        child: NavigationBar(),
      ),
      body: Stack(
        children: <Widget>[
          Center(
            child: Image.asset(
              'assets/images/movies/bg.jpg',
              fit: BoxFit.fill,
              width: SizeHelper.displayWidth,
              height: SizeHelper.displayHeight,
            ),
          ),
          Center(
            child: Image.asset(
              'assets/images/movies/bg.gif',
              fit: BoxFit.fill,
              width: SizeHelper.displayWidth,
              height: SizeHelper.displayHeight,
            ),
          ),
          Center(
            child: FlatButton(
              padding: EdgeInsets.all(8.0),
              hoverColor: Colors.white,
              onPressed: () {
                ExtendedNavigator.of(context).pushNamed(Routes.weepingEmperor);
              },
              child: Container(
                width: SizeHelper.displayWidth * 0.4,
                height: SizeHelper.displayHeight * 0.7,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/images/movies/weeping_emperor/poster_hd.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Footer(
              footerHeight: FooterConstants.footerHeightTablet,
            ),
          ),
        ],
      ),
    );
  }
}

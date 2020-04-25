import 'package:flutter/material.dart';
import 'package:website/constants/constants.dart';
import 'package:website/helpers/sizes_helpers.dart';
import 'package:website/widgets/footer/footer.dart';
import 'package:website/widgets/navigation_bar/navigation_bar.dart';
import 'package:website/widgets/navigation_drawer/navigation_drawer.dart';

class AppsContentMobile extends StatelessWidget {
  const AppsContentMobile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 100),
        child: NavigationBar(),
      ),
      body: Stack(
        children: <Widget>[
          Center(
            child: Container(
              width: SizeHelper.displayWidth * 0.5,
              height: SizeHelper.displayHeight * 0.5,
              child: Image.network(
                  'https://media.giphy.com/media/Utc5g8lnctVSPItLFY/source.gif'),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Footer(
              footerHeight: FooterConstants.footerHeightMobileLandscape,
            ),
          ),
        ],
      ),
    );
  }
}

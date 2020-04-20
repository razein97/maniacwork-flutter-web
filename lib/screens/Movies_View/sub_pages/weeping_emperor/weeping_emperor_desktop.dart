import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:website/helpers/sizes_helpers.dart';
import 'package:website/widgets/centered_view/centered_view.dart';
import 'package:website/widgets/movie_details/movie_details_landscape.dart';
import 'package:website/widgets/navigation_bar/navigation_bar.dart';

class WeepingEmperorDesktop extends StatelessWidget {
  final String filePath;
  const WeepingEmperorDesktop({Key key, this.filePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 100),
        child: NavigationBar(),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(105, 124, 194, 1),
            ),
            child: Container(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black]),
            ),
          ),
          CenteredView(
            hPadding: 0,
            vPadding: 0,
            maxWidth:
                displayWidth(context) > 1279 && displayWidth(context) <= 1366
                    ? displayWidth(context) * 0.9
                    : displayWidth(context) * 0.8,
            maxHeight: displayHeight(context),
            child: MovieDetailsLandscape(
              filePath: filePath,
              showWatchNowButton: true,
              bodyFontSize: 0.02,
              titleFontSize: 0.05,
              buttonSize: 60,
            ),
          ),
        ],
      ),
    );
  }
}

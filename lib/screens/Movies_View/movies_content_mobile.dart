import 'package:flutter/material.dart';
import 'package:website/helpers/sizes_helpers.dart';

class MoviesContentMobile extends StatelessWidget {
  const MoviesContentMobile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Center(
          child: Image.asset(
            'assets/images/movies/bg.jpg',
            fit: BoxFit.fill,
            width: displayWidth(context),
            height: displayHeight(context),
          ),
        ),
        Center(
          child: Image.asset(
            'assets/images/movies/bg.gif',
            fit: BoxFit.fill,
            width: displayWidth(context),
            height: displayHeight(context),
          ),
        ),
        Center(
          child: GestureDetector(
            child: Container(
              width: displayWidth(context) * 0.5,
              height: displayHeight(context) * 0.5,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/images/movies/weeping_emperor/poster_hd.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

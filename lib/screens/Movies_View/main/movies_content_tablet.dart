import 'package:flutter/material.dart';
import 'package:website/extras/locator.dart';
import 'package:website/helpers/sizes_helpers.dart';
import 'package:website/routing/route_names.dart';
import 'package:website/services/navigation_service.dart';

class MoviesContentTablet extends StatelessWidget {
  const MoviesContentTablet({Key key}) : super(key: key);

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
            //'https://media.giphy.com/media/3htQ6tCfZ3qfv4sXk6/giphy.gif',
            'assets/images/movies/bg.gif',
            fit: BoxFit.fill,
            width: displayWidth(context),
            height: displayHeight(context),
          ),
        ),
        Center(
          child: FlatButton(
            padding: EdgeInsets.all(8.0),
            hoverColor: Colors.white,
            onPressed: () {
              locator<NavigationService>().navigateTo(WeepingEmperorRoute);
            },
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

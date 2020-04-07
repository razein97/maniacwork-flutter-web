import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:website/helpers/sizes_helpers.dart';
import 'package:website/routing/router.gr.dart';
import 'package:website/widgets/navigation_bar/navigation_bar.dart';
import 'package:website/widgets/navigation_drawer/navigation_drawer.dart';

class MoviesContentMobile extends StatelessWidget {
  const MoviesContentMobile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      body: Column(
        children: <Widget>[
          NavigationBar(),
          Expanded(
            child: Stack(
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
                  child: FlatButton(
                    padding: EdgeInsets.all(8.0),
                    hoverColor: Colors.white,
                    onPressed: () {
                      ExtendedNavigator.of(context)
                          .pushNamed(Routes.weepingEmperor);
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
            ),
          ),
        ],
      ),
    );
  }
}

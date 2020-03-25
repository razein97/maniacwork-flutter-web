import 'package:flutter/material.dart';
import 'package:website/routing/router.gr.dart';

class MoviesContentDesktop extends StatelessWidget {
  const MoviesContentDesktop({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: Text(
            "MOvies CONTENT DESKTOP",
            style: TextStyle(fontSize: 100.0),
          ),
        ),
        FlatButton(
          child: Text('APP SCreen'),
          color: Colors.blue,
          onPressed: () {
            navigateToSecond(context);
          },
        ),
      ],
    );
  }

  void navigateToSecond(BuildContext context) {
    Router.navigator.pushNamed(Router.appsView);
  }
}

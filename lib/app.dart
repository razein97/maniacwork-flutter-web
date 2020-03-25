import 'package:flutter/material.dart';
import 'package:website/routing/router.gr.dart';

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Maniacwork',
      initialRoute: Router.layoutTemplate,
      onGenerateRoute: Router.onGenerateRoute,
      navigatorKey: Router.navigatorKey,
    );
  }
}

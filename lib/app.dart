import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:website/routing/router.gr.dart';

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Maniacwork',
      builder: ExtendedNavigator<Router>(
        initialRoute: Routes.home,
        router: Router(),
      ),
    );
  }
}

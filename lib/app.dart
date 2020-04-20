import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:website/routing/router.gr.dart';
import 'package:website/style.dart';

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Maniacwork',
      theme: AppTheme.darkTheme,
      builder: ExtendedNavigator<Router>(
        initialRoute: Routes.home,
        router: Router(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:website/extras/locator.dart';
import 'package:website/routing/route_names.dart';
import 'package:website/routing/router.dart';
import 'package:website/screens/Layout_Template/layout_template.dart';
import 'package:website/services/navigation_service.dart';

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Maniacwork',
      builder: (context, child) => LayoutTemplate(
        child: child,
      ),
      navigatorKey: locator<NavigationService>().navigatorKey,
      onGenerateRoute: generateRoute,
      initialRoute: HomeRoute,
    );
  }
}

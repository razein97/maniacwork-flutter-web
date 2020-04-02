import 'package:flutter/material.dart';
import 'package:website/routing/route_names.dart';
import 'package:website/screens/Apps_View/apps_view.dart';
import 'package:website/screens/Home_View/home_view.dart';
import 'package:website/screens/Movies_View/movies_view.dart';
import 'package:website/screens/Movies_View/sub_pages/weeping_emperor/weeping_emperor.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeRoute:
      return _getPageRoute(HomeView());
    case AppsRoute:
      return _getPageRoute(AppsView());
    case MoviesRoute:
      return _getPageRoute(MoviesView());

    case WeepingEmperorRoute:
      return _getPageRoute(WeepingEmperorMain());
    // case SourceCodeRoute:
    //   return _getPageRoute(SourceCodeView());
    default:
      return null;
  }
}

PageRoute _getPageRoute(Widget child) {
  return _FadeRoute(child: child);
}

class _FadeRoute extends PageRouteBuilder {
  final Widget child;
  _FadeRoute({this.child})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              child,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/router_utils.dart';
import 'package:website/screens/Layout_Template/layout_template.dart';
import 'package:website/screens/Home_View/home_view.dart';
import 'package:website/screens/Movies_View/movies_view.dart';
import 'package:website/screens/Apps_View/apps_view.dart';

class Router {
  static const layoutTemplate = '/';
  static const homeView = '/home-view';
  static const moviesView = '/movies-view';
  static const appsView = '/apps-view';
  static GlobalKey<NavigatorState> get navigatorKey =>
      getNavigatorKey<Router>();
  static NavigatorState get navigator => navigatorKey.currentState;

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Router.layoutTemplate:
        if (hasInvalidArgs<Key>(args)) {
          return misTypedArgsRoute<Key>(args);
        }
        final typedArgs = args as Key;
        return MaterialPageRoute(
          builder: (_) => LayoutTemplate(key: typedArgs),
          settings: settings,
        );
      case Router.homeView:
        if (hasInvalidArgs<Key>(args)) {
          return misTypedArgsRoute<Key>(args);
        }
        final typedArgs = args as Key;
        return MaterialPageRoute(
          builder: (_) => HomeView(key: typedArgs),
          settings: settings,
        );
      case Router.moviesView:
        if (hasInvalidArgs<Key>(args)) {
          return misTypedArgsRoute<Key>(args);
        }
        final typedArgs = args as Key;
        return MaterialPageRoute(
          builder: (_) => MoviesView(key: typedArgs),
          settings: settings,
        );
      case Router.appsView:
        if (hasInvalidArgs<Key>(args)) {
          return misTypedArgsRoute<Key>(args);
        }
        final typedArgs = args as Key;
        return MaterialPageRoute(
          builder: (_) => AppsView(key: typedArgs),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}

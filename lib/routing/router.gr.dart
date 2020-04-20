// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:website/screens/Home_View/home_view.dart';
import 'package:website/screens/Movies_View/movies_view.dart';
import 'package:website/screens/Apps_View/apps_view.dart';
import 'package:website/screens/VideoPlayer_view/videoplayer_main.dart';
import 'package:website/screens/Movies_View/sub_pages/weeping_emperor/weeping_emperor.dart';

abstract class Routes {
  static const home = '/';
  static const movies = '/movies';
  static const apps = '/apps';
  static const videoPlayerMain = '/video-player-main';
  static const weepingEmperor = '/weeping-emperor';
}

class Router extends RouterBase {
  //This will probably be removed in future versions
  //you should call ExtendedNavigator.ofRouter<Router>() directly
  static ExtendedNavigatorState get navigator =>
      ExtendedNavigator.ofRouter<Router>();

  @override
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.home:
        if (hasInvalidArgs<HomeViewArguments>(args)) {
          return misTypedArgsRoute<HomeViewArguments>(args);
        }
        final typedArgs = args as HomeViewArguments ?? HomeViewArguments();
        return MaterialPageRoute<dynamic>(
          builder: (_) => HomeView(key: typedArgs.key),
          settings: settings,
        );
      case Routes.movies:
        if (hasInvalidArgs<MoviesViewArguments>(args)) {
          return misTypedArgsRoute<MoviesViewArguments>(args);
        }
        final typedArgs = args as MoviesViewArguments ?? MoviesViewArguments();
        return MaterialPageRoute<dynamic>(
          builder: (_) => MoviesView(key: typedArgs.key),
          settings: settings,
        );
      case Routes.apps:
        if (hasInvalidArgs<AppsViewArguments>(args)) {
          return misTypedArgsRoute<AppsViewArguments>(args);
        }
        final typedArgs = args as AppsViewArguments ?? AppsViewArguments();
        return MaterialPageRoute<dynamic>(
          builder: (_) => AppsView(key: typedArgs.key),
          settings: settings,
        );
      case Routes.videoPlayerMain:
        if (hasInvalidArgs<VideoPlayerMainArguments>(args, isRequired: true)) {
          return misTypedArgsRoute<VideoPlayerMainArguments>(args);
        }
        final typedArgs = args as VideoPlayerMainArguments;
        return MaterialPageRoute<dynamic>(
          builder: (_) => VideoPlayerMain(videoSources: typedArgs.videoSources),
          settings: settings,
        );
      case Routes.weepingEmperor:
        if (hasInvalidArgs<WeepingEmperorMainArguments>(args)) {
          return misTypedArgsRoute<WeepingEmperorMainArguments>(args);
        }
        final typedArgs = args as WeepingEmperorMainArguments ??
            WeepingEmperorMainArguments();
        return MaterialPageRoute<dynamic>(
          builder: (_) => WeepingEmperorMain(key: typedArgs.key),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}

//**************************************************************************
// Arguments holder classes
//***************************************************************************

//HomeView arguments holder class
class HomeViewArguments {
  final Key key;
  HomeViewArguments({this.key});
}

//MoviesView arguments holder class
class MoviesViewArguments {
  final Key key;
  MoviesViewArguments({this.key});
}

//AppsView arguments holder class
class AppsViewArguments {
  final Key key;
  AppsViewArguments({this.key});
}

//VideoPlayerMain arguments holder class
class VideoPlayerMainArguments {
  final List<String> videoSources;
  VideoPlayerMainArguments({@required this.videoSources});
}

//WeepingEmperorMain arguments holder class
class WeepingEmperorMainArguments {
  final Key key;
  WeepingEmperorMainArguments({this.key});
}

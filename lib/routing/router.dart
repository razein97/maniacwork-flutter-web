import 'package:auto_route/auto_route_annotations.dart';
import 'package:website/screens/Apps_View/apps_view.dart';
import 'package:website/screens/Home_View/home_view.dart';
import 'package:website/screens/Layout_Template/layout_template.dart';
import 'package:website/screens/Movies_View/movies_view.dart';

@autoRouter
class $Router {
  @initial
  LayoutTemplate layoutTemplate;
  HomeView homeView;
  MoviesView moviesView;
  AppsView appsView;
}

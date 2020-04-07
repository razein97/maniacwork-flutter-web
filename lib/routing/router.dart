import 'package:auto_route/auto_route_annotations.dart';
import 'package:website/screens/Apps_View/apps_view.dart';
import 'package:website/screens/Home_View/home_view.dart';
import 'package:website/screens/Layout_Template/layout_template.dart';
import 'package:website/screens/Movies_View/movies_view.dart';
import 'package:website/screens/Movies_View/sub_pages/weeping_emperor/weeping_emperor.dart';

@MaterialAutoRouter()
class $Router {
  @initial
  HomeView home;
  MoviesView movies;
  AppsView apps;

  //Subpage Movies
  WeepingEmperorMain weepingEmperor;
}

import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:website/screens/Movies_View/movies_content_desktop.dart';
import 'package:website/screens/Movies_View/movies_content_mobile.dart';
import 'package:website/screens/Movies_View/movies_content_tablet.dart';

class MoviesView extends StatelessWidget {
  const MoviesView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => MoviesContentMobile(),
      tablet: (BuildContext context) => MoviesContentTablet(),
      desktop: (BuildContext context) => MoviesContentDesktop(),
    );
  }
}

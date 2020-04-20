import 'dart:ui';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:website/helpers/sizes_helpers.dart';
import 'package:website/routing/router.gr.dart';
import 'package:website/screens/Movies_View/sub_pages/weeping_emperor/weeping_emperor_data.dart';
import 'package:website/widgets/movie_details/movie_details_styles.dart';

class MovieDetailsLandscape extends StatefulWidget {
  final String filePath;
  final bool showWatchNowButton;
  final double bodyFontSize;
  final double titleFontSize;
  final double buttonSize;

  MovieDetailsLandscape({
    this.filePath,
    this.showWatchNowButton,
    this.bodyFontSize,
    this.titleFontSize,
    this.buttonSize,
  });

  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetailsLandscape> {
  String data = "";
  String releaseYear = "";
  String genre = "";
  String runtime = "";
  String title = "";
  String additionalTitle = "";
  String plot = "";
  List<String> directors = [];
  List<String> writers = [];
  List<String> stars = [];
  List<String> videoSources = [];

  bool showWatchNowButton = true;

  @override
  void initState() {
    fetchJsonData();
    showWatchNowButton = widget.showWatchNowButton;
    super.initState();
  }

  Future<void> fetchJsonData() async {
    data = await DefaultAssetBundle.of(context).loadString(widget.filePath);

    populateData();
  }

  void populateData() {
    final movieData = movieDataFromJson(data);
    setState(() {
      releaseYear = movieData.releaseYear;
      genre = movieData.genre;
      runtime = movieData.runtime;
      title = movieData.title;
      additionalTitle = movieData.additionalTitle;
      plot = movieData.plot;
      directors = movieData.directors;
      writers = movieData.writers;
      stars = movieData.stars;
      videoSources = movieData.videoSources;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        //This contains the poster
        Column(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                child: Image.asset(
                  'assets/images/movies/weeping_emperor/6814797_landscape_1564162383.jpg',
                  fit: BoxFit.fill,
                ),
              ),
            ),

            //This is the Play Button

            Row(
              children: <Widget>[
                Expanded(
                  flex: 5,
                  child: Container(
                    height: widget.buttonSize,
                    child: FlatButton(
                      color: Colors.red,
                      onPressed: () {
                        ExtendedNavigator.of(context).pushNamed(
                          Routes.videoPlayerMain,
                          arguments: VideoPlayerMainArguments(
                              videoSources: videoSources),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            'WATCH NOW',
                            style: movieButtonTextStyle.copyWith(
                                fontSize: displayHeight(context) *
                                    widget.bodyFontSize),
                          ),
                          Icon(
                            Icons.arrow_right,
                            size: displayWidth(context) * widget.bodyFontSize,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: widget.buttonSize,
                    child: FlatButton(
                      padding: EdgeInsets.zero,
                      color: Color.fromRGBO(67, 101, 173, 1.0),
                      onPressed: () {},
                      child: Icon(
                        FontAwesomeIcons.facebook,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: widget.buttonSize,
                    child: FlatButton(
                      padding: EdgeInsets.zero,
                      color: Colors.blue,
                      onPressed: () {},
                      child: Icon(
                        FontAwesomeIcons.twitter,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: widget.buttonSize,
                    child: FlatButton(
                      padding: EdgeInsets.zero,
                      color: Colors.grey,
                      onPressed: () {},
                      child: Icon(
                        FontAwesomeIcons.shareAlt,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: displayHeight(context) * 0.03,
            ),

            Text(
              title,
              style: movieTitleTextStyle.copyWith(
                  fontSize: displayHeight(context) * widget.titleFontSize),
            ),
            Text(
              additionalTitle,
              style: movieAdditionalTitleTextStyle.copyWith(
                fontSize:
                    displayHeight(context) * (widget.titleFontSize - 0.02),
              ),
            ),
            SizedBox(
              height: displayHeight(context) * 0.03,
            ),

            //This is the run time
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: releaseYear,
                    style: movieAdditionalTextStyle.copyWith(
                      fontSize: displayHeight(context) *
                          (widget.bodyFontSize - 0.003),
                    ),
                  ),
                  TextSpan(
                    text: ' | ',
                    style: movieAdditionalTextStyle.copyWith(
                      fontSize: displayHeight(context) *
                          (widget.bodyFontSize - 0.003),
                    ),
                  ),
                  TextSpan(
                    text: genre,
                    style: movieAdditionalTextStyle.copyWith(
                      fontSize: displayHeight(context) *
                          (widget.bodyFontSize - 0.003),
                    ),
                  ),
                  TextSpan(
                    text: ' | ',
                    style: movieAdditionalTextStyle.copyWith(
                      fontSize: displayHeight(context) *
                          (widget.bodyFontSize - 0.003),
                    ),
                  ),
                  TextSpan(
                    text: runtime,
                    style: movieAdditionalTextStyle.copyWith(
                      fontSize: displayHeight(context) *
                          (widget.bodyFontSize - 0.003),
                    ),
                  ),
                ],
              ),
            ),
            //This Contains all the movie detail
            SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: RichText(
                    text: TextSpan(
                      text: plot,
                      style: movieBodyTextStyle.copyWith(
                        fontSize: displayHeight(context) * widget.bodyFontSize,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Directors\n',
                              style: movieSubTitleTextStyle.copyWith(
                                fontSize: displayHeight(context) *
                                    widget.bodyFontSize,
                              ),
                            ),
                            TextSpan(
                              text: directors
                                  .toString()
                                  .replaceAll('[', '')
                                  .replaceAll(']', ''),
                              style: movieBodyTextStyle.copyWith(
                                fontSize: displayHeight(context) *
                                    widget.bodyFontSize,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Stars\n',
                              style: movieSubTitleTextStyle.copyWith(
                                fontSize: displayHeight(context) *
                                    widget.bodyFontSize,
                              ),
                            ),
                            TextSpan(
                              text: stars
                                  .toString()
                                  .replaceAll('[', '')
                                  .replaceAll(']', ''),
                              style: movieBodyTextStyle.copyWith(
                                fontSize: displayHeight(context) *
                                    widget.bodyFontSize,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Writers\n',
                              style: movieSubTitleTextStyle.copyWith(
                                fontSize: displayHeight(context) *
                                    widget.bodyFontSize,
                              ),
                            ),
                            TextSpan(
                              text: writers
                                  .toString()
                                  .replaceAll('[', '')
                                  .replaceAll(']', ''),
                              style: movieBodyTextStyle.copyWith(
                                fontSize: displayHeight(context) *
                                    widget.bodyFontSize,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}

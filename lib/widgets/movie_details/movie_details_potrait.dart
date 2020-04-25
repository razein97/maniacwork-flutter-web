import 'dart:ui';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:website/constants/constants.dart';
import 'package:website/helpers/sizes_helpers.dart';
import 'package:website/routing/router.gr.dart';
import 'package:website/screens/Movies_View/sub_pages/weeping_emperor/weeping_emperor_data.dart';
import 'package:website/widgets/footer/footer.dart';
import 'package:website/widgets/movie_details/movie_details_styles.dart';
import 'package:website/extensions/hover_extensions.dart';

class MovieDetailsPotrait extends StatefulWidget {
  final String filePath;
  final String posterPath;
  final double bodyFontSize;
  final double titleFontSize;
  final double buttonHeight;

  MovieDetailsPotrait({
    this.filePath,
    this.posterPath,
    this.bodyFontSize,
    this.titleFontSize,
    this.buttonHeight,
  });

  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetailsPotrait> {
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

  @override
  void initState() {
    fetchJsonData();
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
        AspectRatio(
          aspectRatio: 16 / 9,
          child: Container(
            child: Image.asset(
              widget.posterPath,
              fit: BoxFit.fill,
            ),
          ),
        ),

        //This is the Play Button

        Container(
          height: widget.buttonHeight,
          width: SizeHelper.displayWidth,
          child: FlatButton(
            padding: EdgeInsets.zero,
            color: Colors.red,
            onPressed: () {
              ExtendedNavigator.of(context).pushNamed(
                Routes.videoPlayer,
                arguments: VideoPlayerMainArguments(videoSources: videoSources),
              );
            },
            child: Text(
              'WATCH NOW',
              style: movieButtonTextStyle.copyWith(
                  fontSize: SizeHelper.displayWidth * widget.bodyFontSize),
            ),
          ),
        ).showCursorOnHover,

        //Title Movie
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: SizeHelper.displayWidth * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: SizeHelper.displayHeight * 0.03,
              ),

              Text(
                title,
                style: movieTitleTextStyle.copyWith(
                    fontSize: SizeHelper.displayWidth * widget.titleFontSize),
              ),
              Text(
                additionalTitle,
                style: movieAdditionalTitleTextStyle.copyWith(
                  fontSize:
                      SizeHelper.displayWidth * (widget.titleFontSize - 0.02),
                ),
              ),
              SizedBox(
                height: SizeHelper.displayHeight * 0.03,
              ),

              //This is the run time
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: releaseYear,
                      style: movieAdditionalTextStyle.copyWith(
                        fontSize: SizeHelper.displayWidth *
                            (widget.bodyFontSize - 0.003),
                      ),
                    ),
                    TextSpan(
                      text: ' | ',
                      style: movieAdditionalTextStyle.copyWith(
                        fontSize: SizeHelper.displayWidth *
                            (widget.bodyFontSize - 0.003),
                      ),
                    ),
                    TextSpan(
                      text: genre,
                      style: movieAdditionalTextStyle.copyWith(
                        fontSize: SizeHelper.displayWidth *
                            (widget.bodyFontSize - 0.003),
                      ),
                    ),
                    TextSpan(
                      text: ' | ',
                      style: movieAdditionalTextStyle.copyWith(
                        fontSize: SizeHelper.displayWidth *
                            (widget.bodyFontSize - 0.003),
                      ),
                    ),
                    TextSpan(
                      text: runtime,
                      style: movieAdditionalTextStyle.copyWith(
                        fontSize: SizeHelper.displayWidth *
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
              RichText(
                text: TextSpan(
                  text: plot,
                  style: movieBodyTextStyle.copyWith(
                    fontSize: SizeHelper.displayWidth * widget.bodyFontSize,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Directors\n',
                      style: movieSubTitleTextStyle.copyWith(
                        fontSize: SizeHelper.displayWidth * widget.bodyFontSize,
                      ),
                    ),
                    TextSpan(
                      text: directors
                          .toString()
                          .replaceAll('[', '')
                          .replaceAll(']', ''),
                      style: movieBodyTextStyle.copyWith(
                        fontSize: SizeHelper.displayWidth * widget.bodyFontSize,
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
                        fontSize: SizeHelper.displayWidth * widget.bodyFontSize,
                      ),
                    ),
                    TextSpan(
                      text: stars
                          .toString()
                          .replaceAll('[', '')
                          .replaceAll(']', ''),
                      style: movieBodyTextStyle.copyWith(
                        fontSize: SizeHelper.displayWidth * widget.bodyFontSize,
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
                        fontSize: SizeHelper.displayWidth * widget.bodyFontSize,
                      ),
                    ),
                    TextSpan(
                      text: writers
                          .toString()
                          .replaceAll('[', '')
                          .replaceAll(']', ''),
                      style: movieBodyTextStyle.copyWith(
                        fontSize: SizeHelper.displayWidth * widget.bodyFontSize,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: SizeHelper.displayHeight * 0.1,
              )
            ],
          ),
        ),

        Footer(
          footerHeight: FooterConstants.footerHeightMobilePotrait,
        ),
      ],
    );
  }
}

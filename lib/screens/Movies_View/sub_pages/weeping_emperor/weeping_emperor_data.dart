// To parse this JSON data, do
//
//     final movieData = movieDataFromJson(jsonString);

import 'dart:convert';

MovieData movieDataFromJson(String str) => MovieData.fromJson(json.decode(str));

String movieDataToJson(MovieData data) => json.encode(data.toJson());

class MovieData {
  final String releaseYear;
  final String genre;
  final String runtime;
  final String title;
  final String additionalTitle;
  final String plot;
  final List<String> directors;
  final List<dynamic> producers;
  final List<String> writers;
  final List<String> stars;
  final List<dynamic> music;
  final List<String> cinematography;
  final List<String> editors;
  final List<String> art;
  final List<String> soundDesign;
  final List<String> lights;
  final List<String> additionalCredits;
  final List<String> videoSources;

  MovieData({
    this.releaseYear,
    this.genre,
    this.runtime,
    this.title,
    this.additionalTitle,
    this.plot,
    this.directors,
    this.producers,
    this.writers,
    this.stars,
    this.music,
    this.cinematography,
    this.editors,
    this.art,
    this.soundDesign,
    this.lights,
    this.additionalCredits,
    this.videoSources,
  });

  factory MovieData.fromJson(Map<String, dynamic> json) => MovieData(
        releaseYear: json["releaseYear"],
        genre: json["genre"],
        runtime: json["runtime"],
        title: json["title"],
        additionalTitle: json["additionalTitle"],
        plot: json["plot"],
        directors: List<String>.from(json["directors"].map((x) => x)),
        producers: List<dynamic>.from(json["producers"].map((x) => x)),
        writers: List<String>.from(json["writers"].map((x) => x)),
        stars: List<String>.from(json["stars"].map((x) => x)),
        music: List<dynamic>.from(json["music"].map((x) => x)),
        cinematography: List<String>.from(json["cinematography"].map((x) => x)),
        editors: List<String>.from(json["editors"].map((x) => x)),
        art: List<String>.from(json["art"].map((x) => x)),
        soundDesign: List<String>.from(json["soundDesign"].map((x) => x)),
        lights: List<String>.from(json["lights"].map((x) => x)),
        additionalCredits:
            List<String>.from(json["additional-credits"].map((x) => x)),
        videoSources: List<String>.from(json["videoSources"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "releaseYear": releaseYear,
        "genre": genre,
        "runtime": runtime,
        "title": title,
        "additionalTitle": additionalTitle,
        "plot": plot,
        "directors": List<dynamic>.from(directors.map((x) => x)),
        "producers": List<dynamic>.from(producers.map((x) => x)),
        "writers": List<dynamic>.from(writers.map((x) => x)),
        "stars": List<dynamic>.from(stars.map((x) => x)),
        "music": List<dynamic>.from(music.map((x) => x)),
        "cinematography": List<dynamic>.from(cinematography.map((x) => x)),
        "editors": List<dynamic>.from(editors.map((x) => x)),
        "art": List<dynamic>.from(art.map((x) => x)),
        "soundDesign": List<dynamic>.from(soundDesign.map((x) => x)),
        "lights": List<dynamic>.from(lights.map((x) => x)),
        "additional-credits":
            List<dynamic>.from(additionalCredits.map((x) => x)),
        "videoSources": List<dynamic>.from(videoSources.map((x) => x)),
      };
}

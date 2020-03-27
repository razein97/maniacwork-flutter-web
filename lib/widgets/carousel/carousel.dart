import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:website/helpers/sizes_helpers.dart';

final List<String> imgList = [
  'assets/images/carousel_images/scr1.jpg',
  'assets/images/carousel_images/scr2.jpg',
  'assets/images/carousel_images/scr3.jpg',
];

class Carousel extends StatelessWidget {
  final bool centerPageEnlarge;
  final double viewportFraction;
  final double aspectRatio;
  final double height;
  Carousel(
      {this.centerPageEnlarge,
      this.viewportFraction,
      this.aspectRatio,
      this.height});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      viewportFraction: viewportFraction,
      aspectRatio: aspectRatio,
      autoPlay: true,
      enableInfiniteScroll: true,
      enlargeCenterPage: centerPageEnlarge,
      height: height,
      pauseAutoPlayOnTouch: Duration(seconds: 3),
      items: imgList.map(
        (i) {
          return Container(
            margin: EdgeInsets.all(5.0),
            child: Image.asset(
              i,
              fit: BoxFit.fill,
              width: displayWidth(context),
            ),
          );
        },
      ).toList(),
    );
  }
}

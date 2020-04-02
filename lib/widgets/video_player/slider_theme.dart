import 'package:flutter/material.dart';
import 'package:website/widgets/CustomSliderTrackShape/custom_slider_track_shape.dart';

class MySliderTheme extends StatelessWidget {
  final BuildContext context;
  final Slider slider;

  MySliderTheme({this.context, this.slider});

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        trackHeight: 4.0,
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 7.0),
        trackShape: CustomTrackShape(),
      ),
      child: slider,
    );
  }
}

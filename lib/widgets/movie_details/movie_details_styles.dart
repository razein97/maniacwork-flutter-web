import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const LightColor = Colors.white;
const FaintColor = Color.fromRGBO(128, 128, 128, 1.0);

final movieButtonTextStyle = GoogleFonts.lato(
  textStyle: TextStyle(
    color: LightColor,
    fontWeight: FontWeight.w600,
  ),
);

final movieTitleTextStyle = GoogleFonts.merriweather(
  textStyle: TextStyle(
    color: LightColor,
    fontWeight: FontWeight.w800,
  ),
);

final movieAdditionalTitleTextStyle = GoogleFonts.merriweather(
  textStyle: TextStyle(
    color: FaintColor,
    fontWeight: FontWeight.w600,
  ),
);

final movieAdditionalTextStyle = GoogleFonts.merriweather(
  textStyle: TextStyle(
    color: FaintColor,
    fontWeight: FontWeight.w500,
  ),
);

final movieBodyTextStyle = GoogleFonts.lato(
  textStyle: TextStyle(
    color: LightColor,
    fontWeight: FontWeight.w400,
  ),
);

final movieSubTitleTextStyle = GoogleFonts.merriweather(
  textStyle: TextStyle(
    color: FaintColor,
    fontWeight: FontWeight.w600,
  ),
);

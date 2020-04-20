import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
    textTheme: TextTheme(
      headline5: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
      bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    brightness: Brightness.dark,
    textTheme: TextTheme(
      headline5: GoogleFonts.roboto(
        textStyle: TextStyle(fontWeight: FontWeight.bold),
      ),
      headline6: GoogleFonts.roboto(
        textStyle: TextStyle(fontWeight: FontWeight.bold),
      ),
      bodyText2: GoogleFonts.lato(
        textStyle: TextStyle(fontWeight: FontWeight.w400),
      ),
    ),
  );
}

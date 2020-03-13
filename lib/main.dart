import 'package:flutter/material.dart';
import 'package:website/homepage/home_page.dart';

void main {
  runApp(
    MaterialApp(title: 'maniacwork.com',
    theme:  ThemeData(primarySwatch: Colors.black),
    home: HomePage(),),
  );
}
import 'package:flutter/material.dart';

class HomeContentDesktop extends StatelessWidget {
  const HomeContentDesktop({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        color: Colors.red,
        child: Text(
          "HOME CONTENT DESKTOP",
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}

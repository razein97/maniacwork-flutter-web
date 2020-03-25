import 'package:flutter/material.dart';

class HomeContentMobile extends StatelessWidget {
  const HomeContentMobile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        color: Colors.blue,
        child: Text(
          "HOME CONTENT MOBILE",
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}

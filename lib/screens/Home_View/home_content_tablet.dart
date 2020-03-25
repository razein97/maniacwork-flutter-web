import 'package:flutter/material.dart';

class HomeContentTablet extends StatelessWidget {
  const HomeContentTablet({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        color: Colors.green,
        child: Text(
          "HOME CONTENT TABLET",
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}

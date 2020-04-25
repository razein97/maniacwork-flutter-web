import 'package:flutter/material.dart';
import 'package:website/helpers/sizes_helpers.dart';

class Footer extends StatelessWidget {
  final double footerHeight;
  const Footer({Key key, this.footerHeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int curYear = DateTime.now().year;
    var myFooterText = Runes('\u00a9   $curYear   Maniacwork   \u{1f60e}');
    return Container(
      color: Colors.black,
      height: SizeHelper.displayWidth * footerHeight,
      width: SizeHelper.displayWidth,
      child: Center(
        child: Text(
          String.fromCharCodes(myFooterText),
          //style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

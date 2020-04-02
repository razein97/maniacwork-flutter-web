import 'package:flutter/material.dart';

class CenteredView extends StatelessWidget {
  final Widget child;
  final double hPadding;
  const CenteredView({Key key, this.child, this.hPadding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: hPadding,
      ),
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 1500,
          maxHeight: 2000,
        ),
        child: child,
      ),
    );
  }
}

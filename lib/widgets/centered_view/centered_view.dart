import 'package:flutter/material.dart';

class CenteredView extends StatelessWidget {
  final Widget child;
  final double hPadding;
  final double maxWidth;
  final double maxHeight;
  const CenteredView(
      {Key key, this.child, this.hPadding, this.maxWidth, this.maxHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: hPadding,
      ),
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: maxWidth,
          maxHeight: maxHeight,
        ),
        child: child,
      ),
    );
  }
}

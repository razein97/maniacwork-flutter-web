import 'package:flutter/material.dart';
import 'package:website/helpers/sizes_helpers.dart';
import 'package:website/routing/router.gr.dart';
import 'package:website/extensions/hover_extensions.dart';

class NavigationBarLogo extends StatelessWidget {
  const NavigationBarLogo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Router.navigator.pushNamed(Router.layoutTemplate);
      },
      child: Container(
        //color: Colors.teal,
        child: SizedBox(
          height: displayWidth(context) * 0.2,
          width: displayHeight(context) * 0.1,
          child: Image.asset('assets/images/logo/LOGO_alpha.png'),
        ).showCursorOnHover,
      ),
    );
  }
}

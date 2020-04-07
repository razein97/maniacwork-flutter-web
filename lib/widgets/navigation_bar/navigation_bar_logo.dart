import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:website/helpers/sizes_helpers.dart';
import 'package:website/extensions/hover_extensions.dart';
import 'package:website/routing/router.gr.dart';

class NavigationBarLogo extends StatelessWidget {
  const NavigationBarLogo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (ModalRoute.of(context)?.settings?.name != Routes.home) {
          ExtendedNavigator.of(context).pushNamed(Routes.home);
        }
      },
      child: SizedBox(
        height: displayWidth(context) * 0.1,
        width: displayHeight(context) * 0.1,
        child: Image.asset(
          'assets/images/logo/LOGO_alpha.png',
          fit: BoxFit.contain,
        ),
      ).showCursorOnHover,
    );
  }
}

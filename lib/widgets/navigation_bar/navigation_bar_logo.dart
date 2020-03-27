import 'package:flutter/material.dart';
import 'package:website/extras/locator.dart';
import 'package:website/helpers/sizes_helpers.dart';
import 'package:website/extensions/hover_extensions.dart';
import 'package:website/routing/route_names.dart';
import 'package:website/services/navigation_service.dart';

class NavigationBarLogo extends StatelessWidget {
  const NavigationBarLogo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        locator<NavigationService>().navigateTo(HomeRoute);
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

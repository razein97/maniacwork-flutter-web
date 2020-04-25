import 'package:flutter/material.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

class WebsiteVisiStats extends StatefulWidget {
  WebsiteVisiStats({Key key}) : super(key: key);

  @override
  _WebsiteVisiStatsState createState() => _WebsiteVisiStatsState();
}

class _WebsiteVisiStatsState extends State<WebsiteVisiStats> {
  Future<String> loadAsset() async {
    return await rootBundle
        .loadString('assets/website_visit_stats/website_visits.txt');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(),
    );
  }
}

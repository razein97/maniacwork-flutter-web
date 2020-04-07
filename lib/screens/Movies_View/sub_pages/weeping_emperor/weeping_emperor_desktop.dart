import 'package:flutter/material.dart';
import 'package:website/helpers/sizes_helpers.dart';
import 'package:website/widgets/centered_view/centered_view.dart';
import 'package:website/widgets/video_player/video_player.dart';

// class WeepingEmperorDesktop extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return CenteredView(
//       hPadding: 50.0,
//       child: ListView(
//         children: <Widget>[
//           GestureDetector(
//             onTap: () {
//               debugPrint('we tapped');
//             },
//             child: Container(
//               width: displayWidth(context),
//               height: displayHeight(context) * 0.5,
//               child: VideoPlayerWeb(),
//               color: Colors.black,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class WeepingEmperorDesktop extends StatefulWidget {
  WeepingEmperorDesktop({Key key}) : super(key: key);

  @override
  _WeepingEmperorDesktopState createState() => _WeepingEmperorDesktopState();
}

class _WeepingEmperorDesktopState extends State<WeepingEmperorDesktop> {
  double _hPadding = 50.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CenteredView(
        hPadding: _hPadding,
        child: ListView(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                debugPrint('we tapped');
              },
              child: Container(
                width: displayWidth(context),
                height: displayHeight(context) * 0.5,
                child: VideoPlayerWeb(),
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:universal_html/html.dart';

class WebFullScreen {
  bool isFullScreen = false;

  void goFullScreen() {
    window.document.documentElement.requestFullscreen();
  }

  void exitFullScreen() {
    window.document.exitFullscreen();
  }
}

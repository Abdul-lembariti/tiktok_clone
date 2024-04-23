import 'package:flutter/material.dart';

final themeConfig = ValueNotifier(false);

class VideoConfig extends ChangeNotifier {
  bool isMuted = false;
  bool isAutoPlay = false;

  void toogleIsMuted() {
    isMuted = !isMuted;
    notifyListeners();
  }

  void toogleAutoPlay() {
    isAutoPlay = !isAutoPlay;
    notifyListeners();
  }
}

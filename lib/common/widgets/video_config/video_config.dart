import 'package:flutter/material.dart';

class VideoConfigData extends InheritedWidget {
  final bool autoMute;
  final void Function() toogleMuted;

  const VideoConfigData({
    super.key,
    required super.child,
    required this.autoMute,
    required this.toogleMuted,
  });

  static VideoConfigData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<VideoConfigData>()!;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}

class VideoConfig extends StatefulWidget {
  final Widget child;

  const VideoConfig({
    super.key,
    required this.child,
  });

  @override
  State<VideoConfig> createState() => _VideoConfigState();
}

class _VideoConfigState extends State<VideoConfig> {
  bool autoMute = false;

  void toogleMuted() {
    setState(() {
      autoMute = !autoMute;
    });
  }

  @override
  Widget build(BuildContext context) {
    return VideoConfigData(
      toogleMuted: toogleMuted,
      autoMute: autoMute,
      child: widget.child,
    );
  }
}

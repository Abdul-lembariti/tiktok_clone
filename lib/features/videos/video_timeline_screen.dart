import 'package:flutter/material.dart';
import 'package:tiktok_clone/features/videos/widget/video_post.dart';

class VideoTimelineScreen extends StatefulWidget {
  const VideoTimelineScreen({super.key});

  @override
  State<VideoTimelineScreen> createState() => _VideoTimelineScreenState();
}

class _VideoTimelineScreenState extends State<VideoTimelineScreen> {
  int _itemCount = 4;

  final PageController _pageController = PageController();

  final _scrollDuration = const Duration(milliseconds: 300);
  final _scrollCurve = Curves.linear;

  void _onPage(int page) {
    _pageController.animateToPage(
      page,
      duration: _scrollDuration,
      curve: _scrollCurve,
    );
    if (page == _itemCount - 1) {
      _itemCount = _itemCount + 4;
      setState(() {});
    }
  }

  void _onVideoFinish() {
    _pageController.nextPage(
      duration: _scrollDuration,
      curve: _scrollCurve,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      pageSnapping: false,
      scrollDirection: Axis.vertical,
      itemCount: _itemCount,
      onPageChanged: _onPage,
      itemBuilder: (context, index) => VideoPost(
        onVideoFinished: _onVideoFinish,
        index:index,
      ),
    );
  }
}

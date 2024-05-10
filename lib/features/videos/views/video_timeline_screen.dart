import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/features/videos/view_modal/timeline_view_modal.dart';
import 'package:tiktok_clone/features/videos/views/widget/video_post.dart';

class VideoTimelineScreen extends ConsumerStatefulWidget {
  const VideoTimelineScreen({super.key});

  @override
  VideoTimelineScreenState createState() => VideoTimelineScreenState();
}

class VideoTimelineScreenState extends ConsumerState<VideoTimelineScreen> {
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
    return;
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _onRefresh() {
    return Future.delayed(
      const Duration(seconds: 5),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ref.watch(timelineProvider).when(
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          error: (error, stackTrace) => Center(
            child: Text(
              'Could not load Videos: $error',
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          data: (videos) => RefreshIndicator(
            onRefresh: _onRefresh,
            displacement: 50,
            edgeOffset: 20,
            color: Theme.of(context).primaryColor,
            child: PageView.builder(
              controller: _pageController,
              pageSnapping: false,
              scrollDirection: Axis.vertical,
              itemCount: videos.length,
              onPageChanged: _onPage,
              itemBuilder: (context, index) => VideoPost(
                onVideoFinished: _onVideoFinish,
                index: index,
              ),
            ),
          ),
          /* data: (videos) {
          _itemCount = videos.length;
          return RefreshIndicator(
            onRefresh: _onRefresh,
            displacement: 50,
            edgeOffset: 20,
            color: Theme.of(context).primaryColor,
            child: PageView.builder(
              controller: _pageController,
              scrollDirection: Axis.vertical,
              onPageChanged: _onPage,
              itemCount: videos.length,
              itemBuilder: (context, index) {
                final videoData = videos[index];
                return VideoPost(
                  onVideoFinished: _onVideoFinish,
                  index: index,
                  // videoData: videoData,
                );
              },
            ),
          );
        } */
        );
  }
}

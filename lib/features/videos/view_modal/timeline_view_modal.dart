import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/features/videos/models/video_modal.dart';

class TimelineViewModal extends AsyncNotifier<List<VideoModal>> {
  List<VideoModal> _list = [];

  void uploadVideo() async {
    state = const AsyncValue.loading();
    await Future.delayed(
      const Duration(seconds: 2),
    );
    _list = [..._list];
    state = AsyncValue.data(_list);
  }

  @override
  FutureOr<List<VideoModal>> build() async {
    await Future.delayed(
      const Duration(seconds: 5),
    );
    return _list;
  }
}

final timelineProvider =
    AsyncNotifierProvider<TimelineViewModal, List<VideoModal>>(
  () => TimelineViewModal(),
);
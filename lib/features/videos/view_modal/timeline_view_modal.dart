import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/features/videos/models/video_modal.dart';
import 'package:tiktok_clone/features/videos/repository/videorepo.dart';

class TimelineViewModal extends AsyncNotifier<List<VideoModal>> {
  late final VideosRepository _repository;
  List<VideoModal> _list = [];

  Future<List<VideoModal>> _fetchVideos({
    int? lastItemCreatedAt,
  }) async {
    final result = await _repository.fetchVideos(
      lastItemCreatedAt: lastItemCreatedAt,
    );
    final videos = result.docs.map(
      (doc) => VideoModal.fromJson(
        doc.data(),
      ),
    );
    return videos.toList();
  }

  @override
  FutureOr<List<VideoModal>> build() async {
    _repository = ref.read(videoRepo);

    _list = await _fetchVideos(lastItemCreatedAt: null);
    return _list;
  }

  fetchNextPage() async {
    final nextPage = await _fetchVideos(
      lastItemCreatedAt: _list.last.createAt,
    );
    state = AsyncValue.data([..._list, ...nextPage]);
  }
}

final timelineProvider =
    AsyncNotifierProvider<TimelineViewModal, List<VideoModal>>(
  () => TimelineViewModal(),
);

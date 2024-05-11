import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/features/authentication/repos/authenticationrepo.dart';
import 'package:tiktok_clone/features/users/view_model/users_view.dart';
import 'package:tiktok_clone/features/videos/models/video_modal.dart';
import 'package:tiktok_clone/features/videos/repository/videorepo.dart';

class UploadVideoViewModel extends AsyncNotifier<void> {
  late final VideosRepository _repository;

  @override
  FutureOr<void> build() {
    _repository = ref.read(videoRepo);
  }

  Future<void> uploadVideo(File video, BuildContext context) async {
    final user = ref.read(authRepo).user;
    final userProfile = ref.read(usersProvider).value;

    if (userProfile != null) {
      state = const AsyncValue.loading();
      state = await AsyncValue.guard(() async {
        final task = await _repository.uploadVideoFile(
          video,
          user!.uid,
        );

        if (task.metadata != null) {
          final downloadUrl = await task.ref.getDownloadURL();
          final videoData = VideoModal(
            id: '',
            title: 'Hello Flutter',
            filUrl: downloadUrl,
            thumbUrl: '',
            description: 'Funny',
            creator: userProfile.name,
            creatorUid: user.uid,
            comments: 0,
            likes: 0,
            createAt: DateTime.now().millisecondsSinceEpoch,
          );

          await _repository.saveVideo(videoData);
          context.go('/home');
        }
      });
    }
  }
}

final uploadVideoProvider = AsyncNotifierProvider<UploadVideoViewModel, void>(
  () => UploadVideoViewModel(),
);

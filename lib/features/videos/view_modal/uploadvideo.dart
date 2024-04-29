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
          await _repository.saveVideo(
            VideoModal(
              title: 'Hello Flutter',
              filUrl: await task.ref.getDownloadUrl(),
              thumbUrl: '',
              description: 'Funny',
              creator: userProfile.name,
              creatorUid: user.uid,
              comments: 0,
              likes: 0,
              createAt: DateTime.now().microsecondsSinceEpoch,
            ),
          );
          context.pushReplacement('/home');
        }
      });
    }
  }
}

final uploadVideoProvider = AsyncNotifierProvider<UploadVideoViewModel, void>(
  () => UploadVideoViewModel(),
);

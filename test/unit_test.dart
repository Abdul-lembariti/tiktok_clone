// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:tiktok_clone/features/videos/models/video_modal.dart';

void main() {
  group('VideoModal Test', () {
    test(' Constuctor', () {
      final video = VideoModal(
        title: 'title',
        filUrl: 'filUrl',
        thumbUrl: 'thumbUrl',
        description: 'description',
        creator: 'creator',
        creatorUid: 'creatorUid',
        id: 'id',
        comments: 1,
        likes: 1,
        createAt: 1,
      );
      expect(video.id, 'id');
    });

    test('.fromJson constructor', () {
      final video = VideoModal.fromJson(
        json: {
          'title': 'title',
          'filUrl': 'filUrl',
          'thumbUrl': 'thumbUrl',
          'description': 'description',
          'creator': 'creator',
          'creatorUid': 'creatorUid',
          'comments': 1,
          'likes': 1,
          'createAt': 1,
          "id": 'id',
        },
        videoId: 'videoId',
      );
      expect(video.title, 'title');
      expect(video.comments, 1);
      expect(video.likes, isInstanceOf<int>());
    });

    test('.toJson method', () {
      final video = VideoModal(
        id: 'id',
        title: 'title',
        filUrl: 'filUrl',
        thumbUrl: 'thumbUrl',
        description: 'description',
        creator: 'creator',
        creatorUid: 'creatorUid',
        comments: 1,
        likes: 1,
        createAt: 1,
      );
      final json = video.toJson();
      expect(json['id'], 'id');
      expect(json['likes'], isInstanceOf<int>());
    });
  });
}

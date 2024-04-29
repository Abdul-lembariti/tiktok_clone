import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/features/videos/models/video_modal.dart';

class VideosRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  uploadVideoFile(File video, String uid) {
    final fileref= _storage.ref().child(
          '/videos/$uid/${DateTime.now().millisecondsSinceEpoch.toString()}',
        );

        return fileref.putFile(video);
  }

  Future<void> saveVideo(VideoModal data)async{
    await _db.collection('videos').add(data.toJson());
  }
}

final videoRepo = Provider((ref) => VideosRepository());

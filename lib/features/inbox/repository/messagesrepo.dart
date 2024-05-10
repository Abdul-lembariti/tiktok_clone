import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/features/inbox/model/messageModel.dart';

class MessageRepo {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> sendMessage(MessageModal message) async {
    //add the same id or doc name as from ur firebs
    await _db
        .collection('chat_rooms')
        .doc('ETeARQWLO8cTEq1PqS11')
        .collection('texts')
        .add(
          message.toJson(),
        );
  }
}

final messageRepo = Provider(
  (ref) => MessageRepo(),
);

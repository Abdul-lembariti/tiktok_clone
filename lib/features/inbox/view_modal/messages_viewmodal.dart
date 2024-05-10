import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/features/authentication/repos/authenticationrepo.dart';
import 'package:tiktok_clone/features/inbox/model/messageModel.dart';
import 'package:tiktok_clone/features/inbox/repository/messagesrepo.dart';

class MessageViewModal extends AsyncNotifier<void> {
  late final MessageRepo _repo;

  @override
  FutureOr<void> build() {
    _repo = ref.read(messageRepo);
  }

  Future<void> sendMessage(String text) async {
    final user = ref.read(authRepo).user;
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final message = MessageModal(
        text: text,
        userId: user!.uid,
        createdAt: DateTime.now().millisecondsSinceEpoch,
      );

      _repo.sendMessage(message);
    });
  }
}

final messageProvider = AsyncNotifierProvider<MessageViewModal, void>(
  () => MessageViewModal(),
);

final chatProvider = StreamProvider.autoDispose<List<MessageModal>>(
  (ref) {
    final db = FirebaseFirestore.instance;

    return db
        .collection("chat_rooms")
        .doc("ETeARQWLO8cTEq1PqS11")
        .collection("texts")
        .orderBy("createdAt")
        .snapshots()
        .map((event) => event.docs
            .map(
              (doc) => MessageModal.fromJson(
                doc.data(),
              ),
            )
            .toList()
            .reversed
            .toList());
  },
);

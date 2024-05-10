import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/features/authentication/repos/authenticationrepo.dart';
import 'package:tiktok_clone/features/inbox/views/chats_screen.dart';
import 'package:tiktok_clone/features/videos/views/video_recording_screen.dart';

class NotificationProvider extends FamilyAsyncNotifier<void, BuildContext> {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  Future<void> updateToken(String token) async {
    final user = ref.read(authRepo).user;

    await _db.collection('users').doc(user!.uid).update({
      'token': token,
    });
  }

  Future<void> intiListners(BuildContext context) async {
    final permission = await _messaging.requestPermission();
    if (permission.authorizationStatus == AuthorizationStatus.denied) {
      return;
    }

    //foreground
    FirebaseMessaging.onMessage.listen((event) {
      print('i just got message');
      print(event.notification?.title);
    });

    //background

    FirebaseMessaging.onMessageOpenedApp.listen((notification) {
      print(notification.data['screen']);
      context.pushNamed(ChatScreen.routeUrl);
    });

    // terminated
    final notification = await _messaging.getInitialMessage();
    if (notification != null) {
      print(notification.data['screen']);
      context.pushNamed(VideoRecording.routeUrl);
    }
  }

  @override
  FutureOr build(BuildContext context) async {
    final token = await _messaging.getToken();
    if (token == null) return;
    await updateToken(token);
    await intiListners(context);
    _messaging.onTokenRefresh.listen((newToken) async {
      await updateToken(newToken);
    });
  }
}

final notificationProvider = AsyncNotifierProvider.family(
  () => NotificationProvider(),
);



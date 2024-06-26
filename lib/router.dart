import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/features/authentication/login_screen.dart';
import 'package:tiktok_clone/features/authentication/repos/authenticationrepo.dart';
import 'package:tiktok_clone/features/authentication/signup.dart';
import 'package:tiktok_clone/features/inbox/views/activity_screen.dart';
import 'package:tiktok_clone/features/inbox/views/chat_detail.dart';
import 'package:tiktok_clone/features/inbox/views/chats_screen.dart';
import 'package:tiktok_clone/features/notification/notification_services.dart';
import 'package:tiktok_clone/features/onboarding/interest_screen.dart';
import 'package:tiktok_clone/features/videos/views/video_recording_screen.dart';
import 'package:tiktok_clone/tab_navigation/main_navigation.dart';

final routerProvider = Provider(
  (ref) {
    // ref.watch(authState);
    return GoRouter(
        initialLocation: '/home',
        redirect: (context, state) {
          final isLoggedIn = ref.read(authRepo).isLoggedIn;
          if (!isLoggedIn) {
            if (state.subloc != SignUpScreen.routeUrl &&
                state.subloc != LoginScreen.routeUrl) {
              return SignUpScreen.routeUrl;
            }
          }
          return null;
        },
        routes: [
          ShellRoute(
            builder: (context, state, child) {
              ref.read(notificationProvider(context));
              return child;
            },
            routes: [
              GoRoute(
                name: SignUpScreen.routerName,
                path: SignUpScreen.routeUrl,
                builder: (context, state) => const SignUpScreen(),
              ),
              GoRoute(
                name: LoginScreen.routeName,
                path: LoginScreen.routeUrl,
                builder: (context, state) => const LoginScreen(),
              ),
              GoRoute(
                name: InterestScreen.routeName,
                path: InterestScreen.routerUrl,
                builder: (context, state) => const InterestScreen(),
              ),
              GoRoute(
                path: '/:tab(home|inbox|discover|profile)',
                name: MainNavigation.routeName,
                builder: (context, state) {
                  final tab = state.params['tab']!;

                  return MainNavigation(tab: tab);
                },
              ),
              GoRoute(
                name: ActivityScreeen.routeName,
                path: ActivityScreeen.routeUrl,
                builder: (context, state) => const ActivityScreeen(),
              ),
              GoRoute(
                name: ChatScreen.routeName,
                path: ChatScreen.routeUrl,
                builder: (context, state) => const ChatScreen(),
                routes: [
                  GoRoute(
                    name: ChatDetail.routeName,
                    path: ChatDetail.routeUrl,
                    builder: (context, state) {
                      final chatId = state.params['chatId'] as String;
                      return ChatDetail(chatId: chatId);
                    },
                  )
                ],
              ),
              GoRoute(
                name: VideoRecording.routeName,
                path: VideoRecording.routeUrl,
                pageBuilder: (context, state) => CustomTransitionPage(
                    transitionDuration: const Duration(
                      milliseconds: 200,
                    ),
                    child: const VideoRecording(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      final position =
                          Tween(begin: const Offset(0, 1), end: Offset.zero)
                              .animate(animation);
                      return SlideTransition(position: position, child: child);
                    }),
              ),
            ],
          )
        ]);
  },
);

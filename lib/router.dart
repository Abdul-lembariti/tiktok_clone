import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/features/authentication/email_screen.dart';
import 'package:tiktok_clone/features/authentication/login_screen.dart';
import 'package:tiktok_clone/features/authentication/signup.dart';
import 'package:tiktok_clone/features/authentication/usernamescreen.dart';
import 'package:tiktok_clone/features/users/profile_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      name: SignUpScreen.routerName,
      path: SignUpScreen.routeUrl,
      builder: (context, state) => const SignUpScreen(),
      routes: [
        GoRoute(
          path: Username.routeUrl,
          name: Username.routeName,
          builder: (context, state) => const Username(),
          routes: [
            GoRoute(
              name: Email.routeName,
              path: Email.routeUlr,
              builder: (context, state) {
                final args = state.extra as EmailScreenArgs;
                return Email(username: args.username);
              },
            ),
          ],
        ),
      ],
    ),
   /*  GoRoute(
      path: LoginScreen.routeName,
      builder: (context, state) => const LoginScreen(),
    ), */
    /* GoRoute(
      name: 'username_screen',
      path: Username.routeName,
      pageBuilder: (context, state) {
        return CustomTransitionPage(
            child: const Username(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: ScaleTransition(
                  scale: animation,
                  child: child,
                ),
              );
            });
      },
    ), */

    GoRoute(
      path: '/users/:username',
      builder: (context, state) {
        final username = state.params['username'];
        final tab = state.queryParams['show'];
        return ProfileScreen(username: username!, tab: tab!);
      },
    ),
  ],
);

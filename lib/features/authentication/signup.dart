import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/login_screen.dart';
import 'package:tiktok_clone/features/authentication/usernamescreen.dart';
import 'package:tiktok_clone/features/authentication/widgets/auth_btn.dart';
import 'package:tiktok_clone/generated/l10n.dart';
import 'package:tiktok_clone/utilis.dart';

class SignUpScreen extends StatelessWidget {
  static const routeUrl = '/';
  static const routerName = 'signUp';

  const SignUpScreen({super.key});

  void _onLogin(BuildContext context) {
    context.push(LoginScreen.routeName);
  }

  void _onEmailTap(BuildContext context) {
    context.pushNamed(Username.routeName);
  }

  @override
  Widget build(BuildContext context) {
    // print(Localizations.localeOf(context));

    return OrientationBuilder(
      builder: (context, orientation) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size40,
              ),
              child: Column(
                children: [
                  Gaps.v80,
                  Text(
                    S.of(context).signUpTitle('TikTok'),
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  Gaps.v20,
                  Text(
                    S.of(context).signUpSubTitle(132),
                    style: TextStyle(
                      fontSize: Sizes.size14,
                      color: isDarkMode(context)
                          ? Colors.grey[200]
                          : Colors.black38,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Gaps.v40,
                  if (orientation == Orientation.portrait) ...[
                    GestureDetector(
                      onTap: () => _onEmailTap(context),
                      child: const AuthButton(
                        icon: FaIcon(FontAwesomeIcons.user),
                        text: 'Use email & password',
                      ),
                    ),
                    Gaps.v16,
                    AuthButton(
                      icon: const FaIcon(FontAwesomeIcons.apple),
                      text: S.of(context).continueWithAppleButon,
                    ),
                  ],
                  if (orientation == Orientation.landscape)
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () => _onEmailTap(context),
                            child: const AuthButton(
                              icon: FaIcon(FontAwesomeIcons.user),
                              text: 'Use email & password',
                            ),
                          ),
                        ),
                        Gaps.h16,
                        Expanded(
                          child: AuthButton(
                            icon: const FaIcon(FontAwesomeIcons.apple),
                            text: S.of(context).continueWithAppleButon,
                          ),
                        ),
                      ],
                    )
                ],
              ),
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            elevation: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  S.of(context).alreadyHaveAnAccount,
                ),
                Gaps.h5,
                GestureDetector(
                  onTap: () => _onLogin(context),
                  child: Text(
                    S.of(context).logIn('male'),
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}


/*  */
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/features/authentication/repos/authenticationrepo.dart';
import 'package:tiktok_clone/features/onboarding/interest_screen.dart';
import 'package:tiktok_clone/features/users/view_model/users_view.dart';
import 'package:tiktok_clone/utilis.dart';

class SignUpViewModel extends AsyncNotifier<void> {
  late final AuthenticationRepository _authRepo;
  @override
  FutureOr<void> build() {
    _authRepo = ref.read(authRepo);
  }

  Future<void> signUp(BuildContext context) async {
    state = const AsyncValue.loading();
    final form = ref.read(signUpForm);
    final user = ref.read(usersProvider.notifier);

    state = await AsyncValue.guard(() async {
      final userCredential = await _authRepo.signUp(
        form['email'],
        form['password'],
        
      );
      if (userCredential.user != null) {
        await user.createAccount(userCredential);
      }
    });
    if (state.hasError) {
      if (state.hasError) {
        showFirebaseErrorSnack(context, state.error);
      }
    } else {
      context.goNamed(InterestScreen.routeName);
    }
  }
}

final signUpForm = StateProvider((ref) => {});

final signUpProvider = AsyncNotifierProvider<SignUpViewModel, void>(
  () => SignUpViewModel(),
);

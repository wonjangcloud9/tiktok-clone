import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/features/authentication/repos/authentication_repo.dart';

class SignUpViewModel extends AsyncNotifier<void> {
  late final AuthenticationRepository _autoRepo;

  @override
  FutureOr<void> build() {
    _autoRepo = ref.read(authRepo);
  }

  Future<void> signUp() async {
    state = AsyncValue.loading();
    final form = ref.read(signUpForm);

    state = await AsyncValue.guard(() async {
      await _autoRepo.signUp(
        form['email'],
        form["password"],
      );
    });
  }
}

final signUpForm = StateProvider((ref) => {});

final signUpProvider = AsyncNotifierProvider<SignUpViewModel, void>(
  () => SignUpViewModel(),
);

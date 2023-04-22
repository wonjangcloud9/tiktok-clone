import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/features/users/models/user_profile_model.dart';

class UsersViewModel extends AsyncNotifier<UserProfileModel> {
  @override
  FutureOr<UserProfileModel> build() {
    return UserProfileModel.empty();
  }

  Future<void> createAccount(UserCredential credential) async {
    if (credential.user == null) {
      throw Exception('Account not created');
    }
    state = AsyncValue.data(
      UserProfileModel(
        bio: 'undefined',
        link: 'undefined',
        name: credential.user!.displayName ?? 'Anonymous',
        uid: credential.user!.uid,
        email: credential.user!.email ?? 'Anonymous@anonymous.com',
      ),
    );
  }
}

final usersProvider = AsyncNotifierProvider(
  () => UsersViewModel(),
);

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/features/users/models/user_profile_model.dart';

class UserRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> createProfile(UserProfileModel user) async {
    // create profile
  }

  // create profile
  // get profile
  // update avatar
  // update bio
  // update link
}

final userRepo = Provider(
  (ref) => UserRepository(),
);

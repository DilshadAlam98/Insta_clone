import 'dart:io';

import 'package:own_projeccts/req/user_req_firestore.dart';
import 'package:own_projeccts/source/firebase_source.dart';

class AuthRepo {
  final firebaseSource = FirebaseSource();

  Future<String> signUpUser({String? email, String? password}) async {
    final signup =
        await firebaseSource.signUp(email: email, password: password);

    return signup;
  }

  Future<String> signInUser({String? email, String? password}) async {
    return await firebaseSource.signInUser(email: email, password: password);
  }

  Future<bool> updateProfile({UserToFirestore? user}) async {
    final update = await firebaseSource.updateProfile(user: user);
    return update;
  }

  Future<void> signOutUser() async {
    return await firebaseSource.signOutUser();
  }

  Future<void> removeUser() async {
    return await firebaseSource.removeUser();
  }

  Future<bool> isUserExistInDb() async {
    return await firebaseSource.isUserExistInDb();
  }

  Future<bool> addUserToFirestore({UserToFirestore? user}) async {
    return await firebaseSource.addUserToDb(user: user);
  }

  Future<String> getProfileUrlFromStorage({File? imageFile}) async {
    final profileUrl =
        await firebaseSource.getProfileUrlFromStorage(imageFile: imageFile);
    return profileUrl;
  }
}

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

  Future<bool> addUserToFirestore({UserToFirestore? user}) async {
    return await firebaseSource.addUserToDb(user: user);
  }

  Future<String> getProfileUrlFromStorage({File? imageFile}) async {
    final profileUrl =
        await firebaseSource.getProfileUrlFromStorage(imageFile: imageFile);
    return profileUrl;
  }
}

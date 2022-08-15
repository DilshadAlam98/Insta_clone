import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:own_projeccts/req/user_req_firestore.dart';

class FirebaseSource {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String> signUp({String? email, String? password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email!, password: password!);

      return "Signed Up";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return "The password provided is too weak.";
      } else if (e.code == 'email-already-in-use') {
        return "The account already exists for that email.";
      } else {
        return "Something Went Wrong.";
      }
    } catch (e) {
      print(e);
    }
    return "Signed Up Failed";
  }

  Future<bool> addUserToDb({UserToFirestore? user}) async {
    bool isAdded = false;
    final fireStore =
        _firestore.collection("users").doc(_auth.currentUser!.uid);
    try {
      await fireStore.get().then((value) async {
        if (value.exists) {
          return false;
        } else {
          await fireStore.set(user!.toJson()).then((value) {
            return isAdded = true;
          });
        }
      });
    } catch (e) {
      print("Failed to add users details in firesrore");
    }
    return isAdded;
  }

  Future<String> getProfileUrlFromStorage({File? imageFile}) async {
    String? profileUrl;
    try {
      final ref = FirebaseStorage.instance;

      var snapshot = await ref
          .ref()
          .child(_auth.currentUser!.uid)
          .child("profile.jpeg")
          .putFile(imageFile!);
      profileUrl = await snapshot.ref.getDownloadURL();
    } catch (error) {
      print(error);
    }

    return profileUrl!;
  }
}

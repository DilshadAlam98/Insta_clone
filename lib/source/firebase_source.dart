import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:own_projeccts/req/user_req_firestore.dart';
import 'package:own_projeccts/utils/error_message.dart';

class FirebaseSource {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  Future<String> signUp({String? email, String? password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email!, password: password!);

      return "Signed Up";
    } on FirebaseAuthException catch (e) {
      return getMessageFromErrorCode(e.code);
    } catch (e) {
      print(e);
    }
    return "Signed Up Failed";
  }

  Future<String> signInUser({String? email, String? password}) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: email!, password: password!);
      return "Signed In";
    } on FirebaseAuthException catch (e) {
      return getMessageFromErrorCode(e.code);
    } catch (e) {
      print("Signed IN failed");
      print(e);
    }
    return "Sign In Failed";
  }

  Future<bool> updateProfile({UserToFirestore? user}) async {
    bool isUpdate=false;
    try {
      await _firestore.collection("users")
          .doc(_auth.currentUser!.uid)
          .update(user!.toJson())
          .then((value) {
        isUpdate= true;
      });
    } catch (e) {
      print("Failed to update User in firestore");
      print(e);
    }
    return isUpdate;
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

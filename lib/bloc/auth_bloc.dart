import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:own_projeccts/base/base_bloc.dart';
import 'package:own_projeccts/repo/auth_repo.dart';
import 'package:rxdart/rxdart.dart';
import 'package:username_generator/username_generator.dart';
import 'package:uuid/uuid.dart';

import '../req/user_req_firestore.dart';

class AuthBloc extends BaseBloc {
  final authRepo = AuthRepo();
  final isLoading = BehaviorSubject<bool>.seeded(false);
  final isUserAdded = BehaviorSubject<bool>.seeded(false);
  final profileUrl = BehaviorSubject<String>();
  final isProfileUrlAvailable = BehaviorSubject.seeded(false);

  Future<bool> signUpUser({String? email, String? password}) async {
    isLoading.add(true);
    final signup = await authRepo.signUpUser(password: password, email: email);
    Fluttertoast.showToast(msg: signup);
    isLoading.add(false);
    if (signup == "Signed Up") {
      return true;
    }
    return false;
  }

  Future<bool> addUserToFirestore(
      {String? fName, String? lName, String? bio, String? profile}) async {
    var uuid = const Uuid();
    var generator = UsernameGenerator();
    final credential = FirebaseAuth.instance.currentUser;
    isUserAdded.add(true);
    var user = UserToFirestore(
        firstName: fName,
        lastName: lName,
        id: uuid.v1(),
        username: generator.generate(
          "${credential!.email}",
          date: DateTime.now(),
        ),
        bio: bio,
        displayName: "$fName" " " "$lName",
        email: credential.email,
        isAvailble: false,
        profileUri: profile,
        userId: credential.uid,
        cretedAt: Timestamp.now(),
        following: [],
        follower: [],
        posts: []);
    if (credential.uid.isNotEmpty) {
      final isAdded = await authRepo.addUserToFirestore(user: user);
      return isAdded;
    }
    isUserAdded.add(false);
    return false;
  }

  /// Get from gallery
  Future<void> pickImage({required ImageSource imageSource}) async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: imageSource,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      isProfileUrlAvailable.add(true);
      final downloadLink = await authRepo.getProfileUrlFromStorage(
          imageFile: File(pickedFile.path));
      profileUrl.add(downloadLink);
      isProfileUrlAvailable.add(false);
    }
  }
}

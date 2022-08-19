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

  Future<bool> signInUser({String? email, String? password}) async {
    isLoading.add(true);
    final signIn = await authRepo.signInUser(email: email, password: password);
    Fluttertoast.showToast(msg: signIn);
    if (signIn == "Signed In") {
      return true;
    }
    isLoading.add(false);
    return false;
  }

  Future<bool> addUserToFirestore(
      {String? fName, String? lName, String? bio, String? profile}) async {
    var uuid = const Uuid();
    var generator = UsernameGenerator();
    final auth = FirebaseAuth.instance;




    final jwtToken = await auth.currentUser?.getIdTokenResult();
    isUserAdded.add(true);
    var user = UserToFirestore(
        firstName: fName,
        lastName: lName,
        id: uuid.v1(),
        username: generator.generate(
          "${auth.currentUser!.email}",
          date: DateTime.now(),
        ),
        jwtToken: jwtToken?.token,
        bio: bio,
        displayName: "$fName" " " "$lName",
        email: auth.currentUser!.email,
        isAvailble: false,
        profileUri: profile,
        userId: auth.currentUser!.uid,
        cretedAt: Timestamp.now(),
        following: [],
        follower: [],
        posts: []);
    if (auth.currentUser!.uid.isNotEmpty) {
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

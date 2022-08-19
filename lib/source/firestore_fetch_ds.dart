import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:own_projeccts/res/user_res.dart';

class FirestoreFetch {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  Stream<UsersRes> fetchUsers() {
    Stream<UsersRes>? users;
    try {
      users= Stream.fromFuture(_firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .get()
          .then((value) {
        return UsersRes.fromJson(value.data()!);
      }));
    } catch (e) {
      print("Error in Fetching Users Collection");
    }
    return users!;
  }
}

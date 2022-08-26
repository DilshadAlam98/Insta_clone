import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:own_projeccts/model/user_model.dart';
import 'package:own_projeccts/res/posts_res.dart';
import 'package:own_projeccts/res/posts_res_list.dart';
import 'package:own_projeccts/res/user_res.dart';
import 'package:rxdart/rxdart.dart';

class FirestoreSource {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  Stream<UsersRes> fetchUsers() {
    Stream<UsersRes>? users;
    try {
      users = Stream.fromFuture(_firestore
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
  PostResList? postResList;
  Future<PostResList> fetchPosts() async{
  await _firestore.collection("users").get().then((value) {
      final data = value.docs;
      for (var p in data) {
        postResList=PostResList.fromJson(p.data());
      }
    });
    print("POST RESSSSSSS");
    print(postResList?.postRes);
    return postResList!;
  }

  Future<bool> uploadPost({required Posts post}) async {
    return _firestore.collection("users").doc(_auth.currentUser!.uid).update({
      'posts': FieldValue.arrayUnion([post.toJson()])
    }).then((value) => true);
  }

  Future<String> getPostUrl({File? postFile}) async {
    String? profileUrl;
    try {
      final ref = FirebaseStorage.instance;

      var snapshot = await ref
          .ref()
          .child(_auth.currentUser!.uid)
          .child("posts.jpeg")
          .putFile(postFile!);
      profileUrl = await snapshot.ref.getDownloadURL();
    } catch (error) {
      print(error);
    }

    return profileUrl!;
  }
}

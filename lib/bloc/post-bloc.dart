import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_crop/image_crop.dart';
import 'package:image_picker/image_picker.dart';
import 'package:own_projeccts/repo/firestore_repo.dart';
import 'package:own_projeccts/res/user_res.dart';
import 'package:own_projeccts/state/post_state.dart';
import 'package:rxdart/rxdart.dart';

import '../base/base_bloc.dart';

class PostBloc extends BaseBloc {
  final _geoLocator = GeolocatorPlatform.instance;
  final _fireStoreRepo = FirestoreRepo();
  final location = BehaviorSubject<String>();
  final postUrl = BehaviorSubject<String?>.seeded(null);
  final postState = BehaviorSubject<PostState>();

  void fetchPosts() {
    postState.add(PostState.loading());
    subscription.add(_fireStoreRepo
        .fetchPosts()
        .map((event) => PostState.completed(event))
        .onErrorReturnWith((error, stackTrace) => PostState.error(error))
        .startWith(PostState.loading())
        .listen((state) {
      postState.add(state);
      print("==========================Posts====================================");
      print(state.data?.posts);
      print(state.data?.posts);
    }));
  }

  Future<bool> uploadPost({String? caption}) async {
    var post = Posts(
        likes: [],
        comments: [],
        caption: caption,
        location: location.valueOrNull,
        postedAt: Timestamp.now(),
        postUri: postUrl.valueOrNull);
    return _fireStoreRepo.uploadPosts(post: post);
  }

  Future<XFile?> pickPost(
      {required ImageSource imageSource, required BuildContext context}) async {
    final pickedFile = await ImagePicker().pickImage(
      imageQuality: 40,
      source: imageSource,
    );
    final sample = await ImageCrop.sampleImage(
        file: File(pickedFile!.path),
        preferredSize: context.size?.longestSide.ceil());

    sample.delete();
    return pickedFile;
  }

  Future<void> cropPost(File file, BuildContext context) async {
    final postFile = await ImageCrop.sampleImage(
        file: file, preferredSize: context.size?.longestSide.ceil());
    print("============CEIL()------------------=");
    print(context.size?.longestSide.ceil());
    final postUri = await _fireStoreRepo.getPostUrl(postFile: postFile);
    postUrl.add(postUri);
  }

  Future<String> getLocationName() async {
    final position =
        await _geoLocator.getCurrentPosition().then((value) => value);
    final location = await getLocation(position);
    return location;
  }

  getLocation(Position position) async {
    final locations =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    final place = locations[0];
    print("==========================================");
    print(place);
    location.add("${place.administrativeArea}, ${place.country}");
    return "${place.administrativeArea}, ${place.country}";
  }
}

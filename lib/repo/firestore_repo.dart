import 'dart:io';

import 'package:own_projeccts/mapper/post_mapper.dart';
import 'package:own_projeccts/mapper/user_mapper.dart';
import 'package:own_projeccts/model/posts_items_lists.dart';
import 'package:own_projeccts/model/user_model.dart';
import 'package:own_projeccts/res/user_res.dart';
import 'package:own_projeccts/source/firestore_fetch_ds.dart';

class FirestoreRepo {
  final _firestoreDs = FirestoreSource();
  final _userMapper = UserMapper();
  final _postsMapper = PostMapper();

  Stream<Users> fetchUsers() {
    return _firestoreDs.fetchUsers().map((value) => _userMapper.convert(value));
  }

  Stream<PostsItemList> fetchPosts() {
    return Stream.fromFuture(_firestoreDs
        .fetchPosts()
        .then((event) => _postsMapper.convert(event)));
  }

  Future<bool> uploadPosts({required Posts post}) async {
    return _firestoreDs.uploadPost(post: post);
  }

  Future<String> getPostUrl({File? postFile}) async {
    return _firestoreDs.getPostUrl(postFile: postFile);
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:own_projeccts/res/posts_res.dart';

class PostsItems {
  String? caption;
  String? postUri;
  Timestamp? postedAt;
  String? location;
  List<PostComment>? comments;
  List<PostsLike>? likes;

  PostsItems(
      {this.caption,
      this.postUri,
      this.postedAt,
      this.location,
      this.comments,
      this.likes});
}

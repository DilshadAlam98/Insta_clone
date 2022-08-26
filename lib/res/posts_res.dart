
import 'package:cloud_firestore/cloud_firestore.dart';

class PostsRes {
  String? caption;
  String? postUri;
  Timestamp? postedAt;
  String? location;
  List<PostComment>? comments;
  List<PostsLike>? likes;

  PostsRes(
      {this.caption,
        this.postUri,
        this.postedAt,
        this.location,
        this.comments,
        this.likes});

  PostsRes.fromJson(Map<String, dynamic> json) {
    caption = json['caption'];
    postUri = json['postUri'];
    postedAt = json['postedAt'];
    location = json['location'];
    if (json['comments'] != null) {
      comments = <PostComment>[];
      json['comments'].forEach((v) {
        comments!.add(new PostComment.fromJson(v));
      });
    }
    if (json['likes'] != null) {
      likes = <PostsLike>[];
      json['likes'].forEach((v) {
        likes!.add(new PostsLike.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['caption'] = this.caption;
    data['postUri'] = this.postUri;
    data['postedAt'] = this.postedAt;
    data['location'] = this.location;
    if (this.comments != null) {
      data['comments'] = this.comments!.map((v) => v.toJson()).toList();
    }
    if (this.likes != null) {
      data['likes'] = this.likes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PostComment {
  String? commentedBy;
  Timestamp? commnetedAt;
  String? profileUri;
  String? userId;

  PostComment({this.commentedBy, this.commnetedAt, this.profileUri, this.userId});

  PostComment.fromJson(Map<String, dynamic> json) {
    commentedBy = json['commentedBy'];
    commnetedAt = json['commnetedAt'];
    profileUri = json['profileUri'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['commentedBy'] = this.commentedBy;
    data['commnetedAt'] = this.commnetedAt;
    data['profileUri'] = this.profileUri;
    data['userId'] = this.userId;
    return data;
  }
}

class PostsLike {
  String? likedBy;
  Timestamp? likedAt;
  String? profileUri;
  String? userId;

  PostsLike({this.likedBy, this.likedAt, this.profileUri, this.userId});

  PostsLike.fromJson(Map<String, dynamic> json) {
    likedBy = json['likedBy'];
    likedAt = json['likedAt'];
    profileUri = json['profileUri'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['likedBy'] = this.likedBy;
    data['likedAt'] = this.likedAt;
    data['profileUri'] = this.profileUri;
    data['userId'] = this.userId;
    return data;
  }
}
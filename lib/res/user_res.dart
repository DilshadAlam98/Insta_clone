import 'package:cloud_firestore/cloud_firestore.dart';

class UsersRes {
  String? firstName;
  String? lastName;
  String? username;
  String? accessToken;
  String? bio;
  String? email;
  String? phoneNumber;
  String? displayName;
  String? id;
  Timestamp? createdAt;
  String? profileUri;
  String? userId;
  bool? isAvailable;
  List<Following>? following;
  List<Follower>? follower;
  List<Posts>? posts;

  UsersRes(
      {this.firstName,
      this.lastName,
      this.username,
      this.accessToken,
      this.bio,
      this.email,
      this.phoneNumber,
      this.displayName,
      this.id,
      this.createdAt,
      this.profileUri,
      this.userId,
      this.isAvailable,
      this.following,
      this.follower,
      this.posts});

  UsersRes.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    username = json['username'];
    accessToken = json['jwt_token'];
    bio = json['bio'];
    email = json['email'];
    phoneNumber = json["phone_number"];
    displayName = json["display_name"];
    id = json['id'];
    createdAt = json['cretedAt'];
    profileUri = json['profileUri'];
    userId = json['userId'];
    isAvailable = json['isAvailble'];
    if (json['following'] != null) {
      following = <Following>[];
      json['following'].forEach((v) {
        following!.add(new Following.fromJson(v));
      });
    }
    if (json['follower'] != null) {
      follower = <Follower>[];
      json['follower'].forEach((v) {
        follower!.add(new Follower.fromJson(v));
      });
    }
    if (json['posts'] != null) {
      posts = <Posts>[];
      json['posts'].forEach((v) {
        posts!.add(new Posts.fromJson(v));
      });
    }
  }
}

class Following {
  String? followingTo;
  String? userId;
  String? id;
  Timestamp? followingAt;
  String? profileUri;
  bool? isFollowedBack;

  Following(
      {this.followingTo,
      this.userId,
      this.id,
      this.followingAt,
      this.profileUri,
      this.isFollowedBack});

  Following.fromJson(Map<String, dynamic> json) {
    followingTo = json['following_to'];
    userId = json['userId'];
    id = json['id'];
    followingAt = json['followingAt'];
    profileUri = json['profileUri'];
    isFollowedBack = json['isFollowedBack'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['following_to'] = this.followingTo;
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['followingAt'] = this.followingAt;
    data['profileUri'] = this.profileUri;
    data['isFollowedBack'] = this.isFollowedBack;
    return data;
  }
}

class Follower {
  String? followedBy;
  String? userId;
  String? id;
  Timestamp? followedAt;
  String? profileUri;
  bool? isFollowedBack;

  Follower(
      {this.followedBy,
      this.userId,
      this.id,
      this.followedAt,
      this.profileUri,
      this.isFollowedBack});

  Follower.fromJson(Map<String, dynamic> json) {
    followedBy = json['followedBy'];
    userId = json['userId'];
    id = json['id'];
    followedAt = json['followedAt'];
    profileUri = json['profileUri'];
    isFollowedBack = json['isFollowedBack'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['followedBy'] = this.followedBy;
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['followedAt'] = this.followedAt;
    data['profileUri'] = this.profileUri;
    data['isFollowedBack'] = this.isFollowedBack;
    return data;
  }
}

class Posts {
  String? caption;
  String? postUri;
  Timestamp? postedAt;
  String? location;
  List<Comments>? comments;
  List<Likes>? likes;

  Posts(
      {this.caption,
      this.postUri,
      this.postedAt,
      this.location,
      this.comments,
      this.likes});

  Posts.fromJson(Map<String, dynamic> json) {
    caption = json['caption'];
    postUri = json['postUri'];
    postedAt = json['postedAt'];
    location = json['location'];
    if (json['comments'] != null) {
      comments = <Comments>[];
      json['comments'].forEach((v) {
        comments!.add(new Comments.fromJson(v));
      });
    }
    if (json['likes'] != null) {
      likes = <Likes>[];
      json['likes'].forEach((v) {
        likes!.add(new Likes.fromJson(v));
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

class Comments {
  String? commentedBy;
  Timestamp? commnetedAt;
  String? profileUri;
  String? userId;

  Comments({this.commentedBy, this.commnetedAt, this.profileUri, this.userId});

  Comments.fromJson(Map<String, dynamic> json) {
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

class Likes {
  String? likedBy;
  Timestamp? likedAt;
  String? profileUri;
  String? userId;

  Likes({this.likedBy, this.likedAt, this.profileUri, this.userId});

  Likes.fromJson(Map<String, dynamic> json) {
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

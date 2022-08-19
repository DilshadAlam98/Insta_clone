import 'package:cloud_firestore/cloud_firestore.dart';

import '../res/user_res.dart';

class UserToFirestore {
  String? firstName;
  String? lastName;
  String? username;
  String? jwtToken;
  String? website;
  String? gender;
  String? bio;
  String? email;
  String? phoneNumber;
  String? displayName;
  String? id;
  Timestamp? cretedAt;
  String? profileUri;
  String? userId;
  bool? isAvailble;
  List<Following>? following;
  List<Follower>? follower;
  List<Posts>? posts;
  List<String>? genderList;

  UserToFirestore(
      {this.firstName,
      this.lastName,
      this.username,
      this.jwtToken,
      this.website,
      this.gender,
      this.bio,
      this.email,
      this.phoneNumber,
      this.displayName,
      this.id,
      this.cretedAt,
      this.profileUri,
      this.userId,
      this.isAvailble,
      this.following,
      this.follower,
      this.posts,
      this.genderList});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['username'] = this.username;
    data['jwt_token'] = this.jwtToken;
    data['website'] = this.website;
    data['gender'] = this.gender;
    data['bio'] = bio;
    data['email'] = email;
    data["display_name"] = displayName;
    data["phone_number"] = phoneNumber;
    data['id'] = this.id;
    data['cretedAt'] = this.cretedAt;
    data['profileUri'] = this.profileUri;
    data['userId'] = this.userId;
    data['isAvailble'] = this.isAvailble;
    if (this.following != null) {
      data['following'] = this.following!.map((v) => v.toJson()).toList();
    }
    if (this.follower != null) {
      data['follower'] = this.follower!.map((v) => v.toJson()).toList();
    }
    if (this.posts != null) {
      data['posts'] = this.posts!.map((v) => v.toJson()).toList();
    }
    data['gender_list'] = this.genderList;
    return data;
  }
}

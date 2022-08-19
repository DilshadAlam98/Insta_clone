import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:own_projeccts/res/user_res.dart';

class Users {
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

  Users(
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['username'] = this.username;
    data['jwt_token'] = this.accessToken;
    data['bio'] = bio;
    data['email'] = email;
    data["display_name"] = displayName;
    data["phone_number"] = phoneNumber;
    data['id'] = this.id;
    data['profileUri'] = this.profileUri;
    data['userId'] = this.userId;
    data['isAvailble'] = this.isAvailable;
    if (this.following != null) {
      data['following'] = this.following!.map((v) => v.toJson()).toList();
    }
    if (this.follower != null) {
      data['follower'] = this.follower!.map((v) => v.toJson()).toList();
    }
    if (this.posts != null) {
      data['posts'] = this.posts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

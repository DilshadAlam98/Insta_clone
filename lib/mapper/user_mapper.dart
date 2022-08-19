import 'package:own_projeccts/base/base_mapper.dart';
import 'package:own_projeccts/model/user_model.dart';
import 'package:own_projeccts/res/user_res.dart';

class UserMapper extends BaseMapper<UsersRes, Users> {
  @override
  Users convert(UsersRes t) {
    return Users(
        email: t.email,
        bio: t.bio,
        phoneNumber: t.phoneNumber,
        userId: t.userId,
        profileUri: t.profileUri,
        id: t.id,
        isAvailable: t.isAvailable,
        posts: t.posts,
        username: t.username,
        accessToken: t.accessToken,
        following: t.following,
        follower: t.follower,
        createdAt: t.createdAt,
        firstName: t.firstName,
        lastName: t.lastName,
        displayName: t.displayName);
  }
}

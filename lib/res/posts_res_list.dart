import 'package:own_projeccts/res/posts_res.dart';

class PostResList {
  List<PostsRes>? postRes;

  PostResList({this.postRes});

  PostResList.fromJson(Map<String, dynamic> json) {
    if (json['posts'] != null) {
      // var post = json['posts'];
      postRes = <PostsRes>[];
      json['posts'].forEach((v) {
        postRes!.add(new PostsRes.fromJson(v));
      });
      // for (var p in post) {
      //   postRes?.add(PostsRes.fromJson(p));
      // }
    }
  }
}
//
// ResOrderList.fromJson(Map<String, dynamic> map) {
// if (map['data'] != null) {
// var orderList = map['data']['listing'];
// for (var o in orderList) {
// order.add(ResOrderListItem.fromJson(o));
// }
// this.meta = Meta.fromJson(map['data']['meta']);
// }
// }

import 'package:own_projeccts/base/base_mapper.dart';
import 'package:own_projeccts/model/posts_item.dart';
import 'package:own_projeccts/model/posts_items_lists.dart';
import 'package:own_projeccts/res/posts_res_list.dart';

class PostMapper extends BaseMapper<PostResList, PostsItemList> {
  @override
  PostsItemList convert(PostResList t) {
    return PostsItemList(
        posts: t.postRes
            ?.map((e) => PostsItems(
                caption: e.caption,
                postUri: e.postUri,
                postedAt: e.postedAt,
                location: e.location,
                comments: e.comments,
                likes: e.likes))
            .toList());
  }
}

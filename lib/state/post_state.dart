import 'package:own_projeccts/base/base_ui_state.dart';
import 'package:own_projeccts/model/posts_items_lists.dart';

class PostState extends BaseUiState<PostsItemList> {
  PostState.loading() : super.loading();

  PostState.completed(PostsItemList post) : super.completed(data: post);

  PostState.error(dynamic e) : super.error(e);
}

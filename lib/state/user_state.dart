import 'package:own_projeccts/base/base_ui_state.dart';
import 'package:own_projeccts/model/user_model.dart';

class UserState extends BaseUiState<Users> {
  UserState.loading() : super.loading();

  UserState.completed(Users users) : super.completed(data: users);

  UserState.error(dynamic e) : super.error(e);
}

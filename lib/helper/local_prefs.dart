import 'dart:convert';

import 'package:own_projeccts/helper/shared_preference.dart';
import 'package:own_projeccts/model/user_model.dart';
import 'package:own_projeccts/res/user_res.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';

class LocalPrefs {
  final prefs = RxSharedPreferences.getInstance();

  // final prefs = SharedPreferenceManager();
  final String prefsKey = "sdjhsk";

  Stream<void> setUsers(Users users) {
    return Stream.fromFuture(
        prefs.setString(prefsKey, jsonEncode(users.toJson())));
  }

  Stream<UsersRes> getUsersPrefs() {
    final users = Stream.fromFuture(prefs.getString(prefsKey));
    print(users);
    users.map((event) => print(event.toString()));
    return users.map((event) => UsersRes.fromJson(jsonDecode(event!)));
  }
}

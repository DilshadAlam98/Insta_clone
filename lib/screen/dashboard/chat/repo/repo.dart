import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:own_projeccts/screen/dashboard/chat/fake_chats_model.dart';

class ChatRepo {
  Future<FakeChatsModel> getchats() async {
    final response = await rootBundle.loadString("assets/fake_chats_data.json");

    final data = await json.decode(response);

    print(data);
    return FakeChatsModel.fromJson(data);
  }
}

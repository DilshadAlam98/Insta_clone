class FakeChatsModel {
  Profile? profile;
  List<FriendsChatLog>? friendsChatLog;
  List<AllFriends>? allFriends;

  FakeChatsModel({this.profile, this.friendsChatLog, this.allFriends});

  FakeChatsModel.fromJson(Map<String, dynamic> json) {
    profile =
    json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
    if (json['friends_chat_log'] != null) {
      friendsChatLog = <FriendsChatLog>[];
      json['friends_chat_log'].forEach((v) {
        friendsChatLog!.add(new FriendsChatLog.fromJson(v));
      });
    }
    if (json['allFriends'] != null) {
      allFriends = <AllFriends>[];
      json['allFriends'].forEach((v) {
        allFriends!.add(new AllFriends.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.profile != null) {
      data['profile'] = this.profile!.toJson();
    }
    if (this.friendsChatLog != null) {
      data['friends_chat_log'] =
          this.friendsChatLog!.map((v) => v.toJson()).toList();
    }
    if (this.allFriends != null) {
      data['allFriends'] = this.allFriends!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Profile {
  int? id;
  String? name;
  String? picture;
  String? status;
  List<Friends>? friends;

  Profile({this.id, this.name, this.picture, this.status, this.friends});

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    picture = json['picture'];
    status = json['status'];
    if (json['friends'] != null) {
      friends = <Friends>[];
      json['friends'].forEach((v) {
        friends!.add(new Friends.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['picture'] = this.picture;
    data['status'] = this.status;
    if (this.friends != null) {
      data['friends'] = this.friends!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Friends {
  int? id;
  String? name;
  String? picture;
  String? latestTimestamp;
  String? status;
  String? lastChat;

  Friends(
      {this.id, this.name, this.picture, this.latestTimestamp, this.lastChat});

  Friends.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    picture = json['picture'];
    latestTimestamp = json['latest_timestamp'];
    status = json['status'];
    lastChat = json['lastChat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['picture'] = this.picture;
    data['latest_timestamp'] = this.latestTimestamp;
    data['lastChat'] = this.lastChat;
    return data;
  }
}

class FriendsChatLog {
  int? id;
  String? name;
  String? picture;
  List<Chatlog>? chatlog;

  FriendsChatLog({this.id, this.name, this.picture, this.chatlog});

  FriendsChatLog.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    picture = json['picture'];
    if (json['chatlog'] != null) {
      chatlog = <Chatlog>[];
      json['chatlog'].forEach((v) {
        chatlog!.add(new Chatlog.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['picture'] = this.picture;
    if (this.chatlog != null) {
      data['chatlog'] = this.chatlog!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Chatlog {
  String? text;
  String? timestamp;
  String? side;
  int? messageId;

  Chatlog({this.text, this.timestamp, this.side, this.messageId});

  Chatlog.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    timestamp = json['timestamp'];
    side = json['side'];
    messageId = json['message_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['timestamp'] = this.timestamp;
    data['side'] = this.side;
    data['message_id'] = this.messageId;
    return data;
  }
}

class AllFriends {
  int? id;
  String? name;
  String? picture;
  String? status;

  AllFriends({this.id, this.name, this.picture, this.status});

  AllFriends.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    picture = json['picture'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['picture'] = this.picture;
    data['status'] = this.status;
    return data;
  }
}

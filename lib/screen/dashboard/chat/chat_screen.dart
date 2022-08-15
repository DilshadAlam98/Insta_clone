import 'package:flutter/material.dart';
import 'package:own_projeccts/screen/dashboard/chat/chat_detail_page.dart';
import 'package:own_projeccts/screen/dashboard/chat/chat_list_screen.dart';
import 'package:own_projeccts/screen/dashboard/chat/fake_chats_model.dart';
import 'package:own_projeccts/screen/dashboard/chat/online_user_list.dart';
import 'package:own_projeccts/screen/dashboard/chat/repo/repo.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  FakeChatsModel? chats;
  String dropdownvalue = 'User 1';

  @override
  void initState() {
    super.initState();
    getChats();
  }

  getChats() async {
    final chat = await ChatRepo().getchats();
    chats = chat;
    setState(() {});
  }

  var items = [
    'User 1',
    'User 2',
    'User 3',
    'User 4',
    'User 5',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
          elevation: 0,
          automaticallyImplyLeading: true,
          backgroundColor: Colors.transparent,
          title: DropdownButton<String>(
              autofocus: true,
              elevation: 0,
              underline: const Center(),
              value: dropdownvalue,
              items: items
                  .map((e) => DropdownMenuItem<String>(
                      value: e,
                      child: Text(
                        e,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 16),
                      )))
                  .toList(),
              onChanged: (String? val) {
                dropdownvalue = val!;
                setState(() {});
              }),
          actions: const [
            Icon(Icons.video_call_rounded, color: Colors.black, size: 35),
            SizedBox(
              width: 5,
            ),
            Icon(
              Icons.add,
              color: Colors.black,
              size: 35,
            )
          ],
        ),
        body: chats == null
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                shrinkWrap: true,
                // padding:
                itemCount: chats!.profile!.friends!.length,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return SizedBox(
                        height: 80,
                        child: OnlineUserList(
                            userOnlineList: chats!.profile!.friends));
                  }
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChatDetailPage(
                              id: chats!.profile!.friends![index].id!,
                              chatLog: chats!.friendsChatLog!,
                              userName: chats!.profile!.friends![index].name!,
                              available: chats!.profile!.friends![index].status!,
                              profileUri:
                                  chats!.profile!.friends![index].picture!,
                            ),
                          ));
                    },
                    child: ChatListScreen(
                      chats: chats!.profile!.friends![index],
                    ),
                  );
                }));
  }
}

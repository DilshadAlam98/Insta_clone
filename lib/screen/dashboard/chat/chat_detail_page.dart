import 'package:flutter/material.dart';
import 'package:own_projeccts/screen/dashboard/chat/fake_chats_model.dart';

class ChatDetailPage extends StatefulWidget {
  const ChatDetailPage(
      {Key? key, required this.id, required this.chatLog, this.friends})
      : super(key: key);

  final int id;
  final List<FriendsChatLog> chatLog;
  final Friends? friends;

  @override
  State<ChatDetailPage> createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  List<FriendsChatLog> chatmessages = [];

  @override
  void initState() {
    getChatMessages();
    super.initState();
  }

  getChatMessages() {
    final chatList =
        widget.chatLog.where((element) => element.id == widget.id).toList();
    chatmessages = chatList;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        elevation: 4,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                    radius: 25,
                    backgroundImage:
                        NetworkImage(widget.friends?.picture ?? "")),
                widget.friends?.status == "Available"
                    ? const Positioned(
                        bottom: 0,
                        right: 0,
                        child: CircleAvatar(
                          backgroundColor: Colors.green,
                          radius: 8,
                        ))
                    : Container()
              ],
            ),
            const SizedBox(
              width: 15,
            ),
            Text(
              widget.friends?.name ?? "",
              style: const TextStyle(color: Colors.black),
            ),
          ],
        ),
        actions: const [
          Icon(
            Icons.call_sharp,
            color: Colors.black,
            size: 30,
          ),
          SizedBox(
            width: 15,
          ),
          Icon(
            Icons.video_camera_front_outlined,
            color: Colors.black,
            size: 32,
          ),
          SizedBox(
            width: 15,
          ),
        ],
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: chatmessages.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.red,
                        radius: 20,
                        backgroundImage:
                            NetworkImage(chatmessages[index].picture!),
                      ),
                      Flexible(
                          child: Align(
                        alignment:
                            chatmessages[index].chatlog![index].side == "left"
                                ? Alignment.centerLeft
                                : Alignment.centerRight,
                        child: Card(
                            color: Colors.white54,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              // child: Text(chatmessages[index]
                              //     .chatlog!
                              //     .map((e) => e.text)
                              //     .toList()
                              //     .join()),

                              child: Column(
                                  children: chatmessages[index]
                                      .chatlog!
                                      .map((e) => Text(e.text ?? ""))
                                      .toList()),
                            )),
                      ))
                    ],
                  ),
                )
              ],
            );
          }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:own_projeccts/screen/dashboard/chat/fake_chats_model.dart';
import 'package:own_projeccts/widget/insta_input_field.dart';

class ChatDetailPage extends StatefulWidget {
  const ChatDetailPage(
      {Key? key,
      required this.id,
      required this.chatLog,
      this.profileUri,
      this.userName,
      this.available})
      : super(key: key);

  final int id;
  final List<FriendsChatLog> chatLog;
  final String? profileUri;
  final String? userName;
  final String? available;

  @override
  State<ChatDetailPage> createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  List<FriendsChatLog> chatmessages = [];
  List<Chatlog>? chatlog;

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
    chatmessages.forEach((element) {
      chatlog = element.chatlog;
    });
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
                    backgroundImage: NetworkImage(widget.profileUri ?? "")),
                widget.available == "Available"
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
              widget.userName ?? "",
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
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.all(8),
                itemCount: chatlog!.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.red,
                            radius: 20,
                            backgroundImage: NetworkImage(widget.profileUri!),
                          ),
                          Flexible(
                              child: Align(
                            alignment: chatlog![index].side == "left"
                                ? Alignment.centerLeft
                                : Alignment.centerRight,
                            child: Card(
                                color: Colors.white54,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Text(chatlog![index].text!),
                                      Stack(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(chatlog![index].timestamp!),
                                              const SizedBox(
                                                width: 8,
                                              ),
                                              const Text("seen")
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                )),
                          ))
                        ],
                      ),
                    ],
                  );
                }),
          ),
        ],
      ),
      bottomNavigationBar: Container(
          padding: MediaQuery.of(context).viewInsets,
          color: Colors.grey[300],
          child: Container(
              padding: const EdgeInsets.symmetric(vertical: 2),
              margin: const EdgeInsets.symmetric(horizontal: 5),
              child: TextFormField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(15),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.send),
                  ),
                  prefixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.photo_album_outlined)),
                  border: InputBorder.none,
                  hintText: 'Type a message',
                ),
              ))),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:own_projeccts/screen/dashboard/chat/fake_chats_model.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({Key? key, required this.chats})
      : super(key: key);
  final Friends chats;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Row(
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(chats.picture!),
                  ),
                  chats.status == "Available"
                      ? const Positioned(
                          bottom: 0,
                          right: 2,
                          child: CircleAvatar(
                            radius: 8,
                            backgroundColor: Colors.green,
                          ))
                      : Container()
                ],
              ),
              Expanded(
                child: ListTile(
                  title: Text(chats.name ?? ""),
                  subtitle: Text(chats.lastChat??""),
                  trailing:  Text(chats.latestTimestamp??""),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

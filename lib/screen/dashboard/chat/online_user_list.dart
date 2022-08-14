import 'package:flutter/material.dart';
import 'package:own_projeccts/screen/dashboard/chat/fake_chats_model.dart';
import 'package:own_projeccts/screen/dashboard/profile_screen/profile_screen.dart';

class OnlineUserList extends StatefulWidget {
  const OnlineUserList({Key? key, this.userOnlineList}) : super(key: key);
  final List<Friends>? userOnlineList;

  @override
  State<OnlineUserList> createState() => _OnlineUserListState();
}

class _OnlineUserListState extends State<OnlineUserList> {
  final List<Friends> allFriends = [];

  @override
  void initState() {
    getOnlineUser();
    super.initState();
  }

  void getOnlineUser() {
    widget.userOnlineList?.forEach((element) {
      if (element.status == "Available") {
        allFriends.add(element);
      }
    });
  }

  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      scrollDirection: Axis.horizontal,
      itemCount: allFriends.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            GestureDetector(
              onTap: () {
              },
              child: Stack(
                children: [
                  SizedBox(
                    height: 55,
                    width: 55,
                    child: ClipRRect(
                        clipBehavior: Clip.antiAlias,
                        borderRadius: BorderRadius.circular(100),
                        child: Image.network(allFriends[index].picture!)),
                  ),
                  const Positioned(
                      bottom: 0,
                      right: 2,
                      child: CircleAvatar(
                        radius: 8,
                        backgroundColor: Colors.green,
                      ))
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(allFriends[index].name!)
          ],
        );
      },
      separatorBuilder: (context, index) => SizedBox(
        width: 10,
      ),
    );
  }
}

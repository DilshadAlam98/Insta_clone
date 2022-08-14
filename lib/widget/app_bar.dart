import 'package:flutter/material.dart';
import 'package:own_projeccts/screen/dashboard/chat/chat_screen.dart';

import '../utils/app_colors.dart';

class InstaAppBar extends StatelessWidget {
  const InstaAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: white,
      centerTitle: true,
      elevation: 1,
      leading: Center(
        child: Image.asset(
          "assets/camera.png",
          height: 24,
          width: 22,
        ),
      ),
      actions: [
        Image.asset(
          "assets/IGTV.png",
          height: 24,
          width: 22,
        ),
        const SizedBox(
          width: 15,
        ),
        InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const ChatScreen()));
          },
          child: Image.asset(
            "assets/Messanger.png",
            height: 24,
            width: 22,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
      ],
      title: Image.asset(
        "assets/Instagram Logo.png",
        width: 105,
        height: 28,
      ),
    );
  }
}

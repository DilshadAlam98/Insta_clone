import 'package:flutter/material.dart';
import 'package:own_projeccts/model/user_model.dart';
import 'package:own_projeccts/screen/dashboard/home/insta_post.dart';
import 'package:own_projeccts/widget/app_bar.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key,this.users}) : super(key: key);
  final Users? users;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(50), child: InstaAppBar()),
        body: InstaPost(users:users));
  }

}

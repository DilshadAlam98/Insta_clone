import 'package:flutter/material.dart';
import 'package:own_projeccts/screen/dashboard/insta_post.dart';
import 'package:own_projeccts/screen/dashboard/stories_view.dart';
import 'package:own_projeccts/utils/app_colors.dart';
import 'package:own_projeccts/widget/app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50), child: InstaAppBar()),
      body: Column(
        children: const [
          SizedBox(height: 95, child: StoriesView()),
          Divider(thickness: 2,),
          InstaPost()
        ],
      ),
    );
  }
}

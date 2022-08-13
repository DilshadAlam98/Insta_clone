import 'package:flutter/material.dart';
import 'package:own_projeccts/screen/dashboard/insta_post.dart';
import 'package:own_projeccts/screen/dashboard/stories_view.dart';
import 'package:own_projeccts/widget/app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(50), child: InstaAppBar()),
        body: InstaPost());
  }
}

import 'package:flutter/material.dart';
import 'package:own_projeccts/bloc/home_bloc.dart';
import 'package:own_projeccts/screen/dashboard/home/insta_post.dart';
import 'package:own_projeccts/widget/app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(50), child: InstaAppBar()),
        body: InstaPost());
  }
}

import 'package:flutter/material.dart';
import 'package:own_projeccts/screen/auth/login_screen.dart';
import 'package:own_projeccts/screen/dashboard/navigation_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner:  false,
      home: NavBar(),
    );
  }
}

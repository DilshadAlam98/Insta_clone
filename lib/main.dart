import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:own_projeccts/helper/local_prefs.dart';
import 'package:own_projeccts/res/user_res.dart';
import 'package:own_projeccts/screen/auth/login_screen.dart';
import 'package:own_projeccts/screen/dashboard/home/navigation_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final pref = LocalPrefs();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder<UsersRes>(
          stream: pref.getUsersPrefs(),
          builder: (context, snapshot) {
            if (snapshot.data?.accessToken != null) {
              return NavBar();
            }
            return LoginScreen();
          }),
    );
  }
}

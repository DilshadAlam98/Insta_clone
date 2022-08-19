import 'package:flutter/material.dart';
import 'package:own_projeccts/bloc/home_bloc.dart';
import 'package:own_projeccts/model/user_model.dart';
import 'package:own_projeccts/screen/dashboard/home/home_screen.dart';
import 'package:own_projeccts/screen/dashboard/profile_screen/profile_screen.dart';
import 'package:own_projeccts/screen/dashboard/search_screen/search_screen.dart';
import 'package:own_projeccts/state/user_state.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final homeBloc = HomeBloc();

  @override
  void initState() {
    super.initState();
    homeBloc.fetchUsers();
  }

  @override
  int _selectedIndex = 0;

  List<Widget> navigationWidget({Users? data}) {
    return [
      const HomeScreen(),
      const SearchScreen(),
      const Center(
        child: Text("add post screen"),
      ),
      const Center(
        child: Text("like screen"),
      ),
      ProfileScreen(users: data)
    ];
  }

  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
            print(_selectedIndex);
          });
        },
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/home.png",
              width: 22,
              height: 24,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/search.png",
              width: 22,
              height: 24,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/tab3.png",
              width: 22,
              height: 24,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/heart.png",
              width: 22,
              height: 24,
            ),
            label: "",
          ),
          const BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 15,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.person,
                color: Colors.grey,
                size: 30,
              ),
            ),
            label: "",
          ),
        ],
      ),
      body: StreamBuilder<UserState>(
        stream: homeBloc.userState,
        builder: (context, snapshot) {
          UserState? state = snapshot.data;
          if (state?.isLoading() ?? false) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return navigationWidget(data: snapshot.data?.data)
              .elementAt(_selectedIndex);
        },
      ),
    );
  }
}

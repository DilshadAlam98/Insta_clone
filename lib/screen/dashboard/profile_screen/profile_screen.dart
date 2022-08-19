import 'package:flutter/material.dart';
import 'package:own_projeccts/model/user_model.dart';
import 'package:own_projeccts/screen/dashboard/profile_screen/highlighted_post.dart';
import 'package:own_projeccts/widget/insta_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key, this.users}) : super(key: key);
  final Users? users;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var items = [
    'User 1',
    'User 2',
    'User 3',
    'User 4',
    'User 5',
  ];
  String dropdownvalue = 'User 1';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        endDrawer: const Drawer(),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.lock,
                color: Colors.black,
                size: 16,
              ),
              DropdownButton<String>(
                  autofocus: true,
                  elevation: 0,
                  underline: const Center(),
                  value: dropdownvalue,
                  items: items
                      .map((e) => DropdownMenuItem<String>(
                          value: e,
                          child: Text(
                            e,
                            style: const TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 16),
                          )))
                      .toList(),
                  onChanged: (String? val) {
                    dropdownvalue = val!;
                    setState(() {});
                  })
            ],
          ),
          actions: [
            Builder(
              builder: (context) => IconButton(
                icon: const Icon(
                  Icons.menu_outlined,
                  color: Colors.black,
                ),
                onPressed: () => Scaffold.of(context).openEndDrawer(),
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(widget.users!.profileUri!),
                    ),
                    profileHeader(
                        value: widget.users!.posts!.length, text: "Posts"),
                    profileHeader(
                        value: widget.users!.following!.length,
                        text: "Followers"),
                    profileHeader(
                        value: widget.users!.follower!.length,
                        text: "Following"),
                  ],
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.users!.displayName!,
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      widget.users!.bio!,
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                    const Text(
                      "Interst",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: InstaButton(
                    hight: 33,
                    color: Colors.white70,
                    onPressed: () {},
                    child: const Text(
                      "Edit Profile",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                          color: Colors.black),
                    )),
              ),
              SizedBox(
                height: 115,
                child: ListView.separated(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  shrinkWrap: true,
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return index == 0
                        ? const NewHighLightedPost()
                        : const HighLightedPosts();
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 20,
                  ),
                ),
              ),
              TabBar(
                tabs: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Image.asset(
                      "assets/Grid Icon.png",
                      height: 24,
                      width: 24,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Image.asset(
                      "assets/person.png",
                      width: 24,
                      height: 24,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 2,
                                mainAxisSpacing: 2,
                                childAspectRatio: 17.4 / 11.5),
                        itemCount: widget.users!.posts!.length,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            height: 124,
                            width: 124,
                            child: Image.network(
                              "https://cdn.pixabay.com/photo/2018/01/28/11/24/sunflower-3113318_960_720.jpg",
                              fit: BoxFit.cover,
                            ),
                          );
                        }),

                    // second tab bar viiew widget
                    GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 2,
                                mainAxisSpacing: 2,
                                childAspectRatio: 17.4 / 11.5),
                        itemCount: 40,
                        itemBuilder: (context, index) {
                          if (widget.users?.posts?.isEmpty == true) {
                            return const Center(
                              child: Text("No Recent Posts found"),
                            );
                          }
                          return SizedBox(
                            height: 124,
                            width: 124,
                            child: Image.network(
                              widget.users!.posts![index].postUri!,
                              fit: BoxFit.cover,
                            ),
                          );
                        }),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Column profileHeader({int? value, String? text}) {
    return Column(
      children: [
        Text(
          value.toString(),
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        Text(
          text!,
          style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 13),
        ),
      ],
    );
  }
}

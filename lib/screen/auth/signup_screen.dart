import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:own_projeccts/bloc/auth_bloc.dart';
import 'package:own_projeccts/screen/dashboard/home/navigation_bar.dart';
import 'package:own_projeccts/widget/insta_button.dart';
import 'package:own_projeccts/widget/insta_input_field.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);
  String _fName = "";
  String _lName = "";
  String _bio = "";
  final authBloc = AuthBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: StreamBuilder<bool>(
            stream: authBloc.isProfileUrlAvailable,
            builder: (context, snapshot) {
              return Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/Instagram Logo.png",
                        width: 150,
                        height: 40,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Column(
                        children: [
                          StreamBuilder<String>(
                              stream: authBloc.profileUrl,
                              builder: (context, snapshot) {
                                return Stack(
                                  children: [
                                    snapshot.data != null
                                        ? CircleAvatar(
                                            radius: 40,
                                            backgroundImage: NetworkImage(
                                                authBloc
                                                    .profileUrl.valueOrNull!),
                                          )
                                        : const CircleAvatar(
                                            radius: 40,
                                            backgroundColor: Colors.white54,
                                            backgroundImage: AssetImage(
                                              "assets/person.png",
                                            )),
                                    Positioned(
                                        bottom: 0,
                                        right: 0,
                                        child: GestureDetector(
                                          onTap: () {
                                            modelBottomSheet(context);
                                          },
                                          child: const Icon(
                                            Icons.camera_alt_outlined,
                                            size: 30,
                                            color: Colors.blue,
                                          ),
                                        ))
                                  ],
                                );
                              }),
                        ],
                      ),

                      const SizedBox(
                        height: 12,
                      ),

                      InstaInputField(
                        onChanged: (value) {
                          _fName = value;
                        },
                        hintText: "First name",
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      InstaInputField(
                        onChanged: (value) {
                          _lName = value;
                        },
                        hintText: "Last name",
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      InstaInputField(
                        onChanged: (value) {
                          _bio = value;
                        },
                        hintText: "Bio",
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      // InstaInputField(
                      //   onChanged: (value) {
                      //     // _password = value;
                      //   },
                      //   hintText: "Password",
                      // ),
                      // const SizedBox(
                      //   height: 12,
                      // ),
                      // InstaInputField(
                      //   onChanged: (value) {
                      //     // _password = value;
                      //   },
                      //   hintText: "Password",
                      // ),
                      // const SizedBox(
                      //   height: 12,
                      // ),
                      // InstaInputField(
                      //   onChanged: (value) {
                      //     // _password = value;
                      //   },
                      //   hintText: "Password",
                      // ),
                      const SizedBox(
                        height: 12,
                      ),
                      StreamBuilder<bool>(
                          stream: authBloc.isUserAdded,
                          builder: (context, snapshot) {
                            if (snapshot.data == true) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            return InstaButton(
                                onPressed: () async {
                                  final userAddedToDb =
                                      await authBloc.addUserToFirestore(
                                          bio: _bio,
                                          fName: _fName,
                                          lName: _lName,
                                          profile:
                                              authBloc.profileUrl.valueOrNull);
                                  if (userAddedToDb) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => NavBar(),
                                        ));
                                  }
                                },
                                child: const Text(
                                  "Sign UP",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 18),
                                ));
                          }),
                    ],
                  ),
                  snapshot.data == true
                      ? const Center(child: CircularProgressIndicator())
                      : Container(),
                ],
              );
            }),
      ),
    );
  }

  Future<dynamic> modelBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      backgroundColor: Colors.blue,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: const Text(
              "Image from Camera",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            trailing: const Icon(
              Icons.camera,
              color: Colors.white,
              size: 30,
            ),
            onTap: () async {
              await authBloc.pickImage(imageSource: ImageSource.camera);
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text(
              "Image from Gallery",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            trailing: const Icon(
              Icons.photo,
              color: Colors.white,
              size: 30,
            ),
            onTap: () async {
              await authBloc.pickImage(imageSource: ImageSource.gallery);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

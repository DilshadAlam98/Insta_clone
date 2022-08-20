import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:own_projeccts/bloc/auth_bloc.dart';
import 'package:own_projeccts/model/user_model.dart';
import 'package:own_projeccts/screen/dashboard/home/navigation_bar.dart';
import 'package:own_projeccts/utils/constant.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key, this.users}) : super(key: key);
  final Users? users;

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final authBloc = AuthBloc();
  String? _name;
  String? _username;
  String? _website;
  String? _bio;
  String? _email;
  String? _phoneNumber;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream: authBloc.isProfileUrlAvailable,
        builder: (context, profileLoading) {
          return StreamBuilder<bool>(
              stream: authBloc.isLoading,
              builder: (context, updateProfile) {
                return Stack(
                  children: [
                    Scaffold(
                        appBar: AppBar(
                          automaticallyImplyLeading: false,
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                  child: const Text(
                                    "Cancel",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.blueGrey),
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  }),
                              const Text(
                                "Edit Profile",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                              TextButton(
                                  child: const Text(
                                    "Done",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  onPressed: () async {
                                    final isUpdated =
                                        await authBloc.updateProfile(
                                            phoneNumber: _phoneNumber,
                                            email: _email,
                                            bio: _bio,
                                            username: _username,
                                            name: _name,
                                            gender: authBloc.gender.valueOrNull,
                                            webSite: _website,
                                            users: widget.users);
                                    if (isUpdated) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => NavBar(),
                                          ));
                                    }
                                  }),
                            ],
                          ),
                        ),
                        body: SingleChildScrollView(
                          child: Column(children: [
                            StreamBuilder<String>(
                                stream: authBloc.profileUrl,
                                builder: (context, snapshot) {
                                  if (snapshot.data != null) {
                                    return CircularProfileAvatar(
                                      snapshot.data ?? "",
                                      child: CircleAvatar(
                                        backgroundImage:
                                            NetworkImage(snapshot.data!),
                                      ),
                                      borderColor: Colors.blue.shade200,
                                      borderWidth: 3,
                                      elevation: 2,
                                      radius: 50,
                                    );
                                  }
                                  return CircularProfileAvatar(
                                    widget.users!.profileUri ?? "",
                                    child: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          widget.users!.profileUri ?? ""),
                                    ),
                                    borderColor: Colors.blue.shade200,
                                    borderWidth: 3,
                                    elevation: 2,
                                    radius: 50,
                                  );
                                }),
                            TextButton(
                                onPressed: () async {
                                  await modelBottomSheet(context, authBloc);
                                },
                                child: const Text("Change Profile Photo")),
                            prefilledInfo(
                                onChanged: (name) {
                                  _name = name;
                                },
                                context: context,
                                text: "Name",
                                initialValue: widget.users?.displayName),
                            prefilledInfo(
                                onChanged: (username) {
                                  _username = username;
                                },
                                context: context,
                                text: "Username",
                                initialValue: widget.users?.username),
                            prefilledInfo(
                                onChanged: (website) {
                                  _website = website;
                                },
                                context: context,
                                text: "Website",
                                initialValue: widget.users?.website),
                            prefilledInfo(
                                onChanged: (bio) {
                                  _bio = bio;
                                },
                                context: context,
                                text: "Bio",
                                initialValue: widget.users!.bio,
                                maxLines: 5),
                            // Padding(
                            //   padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            //   child: Row(
                            //     crossAxisAlignment: CrossAxisAlignment.start,
                            //     children: [
                            //       SizedBox(
                            //           width: MediaQuery.of(context).size.width / 3.5,
                            //           child: const Text("Bio")),
                            //       Expanded(
                            //         child: Text(
                            //           widget.users!.bio!,
                            //           style: const TextStyle(
                            //               fontSize: 14, fontWeight: FontWeight.w400),
                            //         ),
                            //       )
                            //     ],
                            //   ),
                            // ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                      "Switch to Professional Account")),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              alignment: Alignment.centerLeft,
                              child: const Text(
                                "Private Information",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w400),
                              ),
                            ),
                            prefilledInfo(
                                onChanged: (email) {
                                  _email = email;
                                },
                                context: context,
                                text: "Email",
                                initialValue: widget.users?.email),
                            prefilledInfo(
                                onChanged: (phone) {
                                  _phoneNumber = phone;
                                },
                                context: context,
                                text: "Phone",
                                initialValue: widget.users?.phoneNumber),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Row(
                                children: [
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          3.5,
                                      child: const Text("Gender")),
                                  Expanded(
                                      child: StreamBuilder<String>(
                                          stream: authBloc.gender,
                                          builder: (context, snapshot) {
                                            return DropdownButtonFormField<
                                                String>(
                                              value: widget.users?.gender,
                                              onChanged: (value) {
                                                authBloc.gender.add(value!);
                                              },
                                              items: widget.users?.genderList!
                                                  .map((e) =>
                                                      DropdownMenuItem<String>(
                                                          value: e,
                                                          child: Text(e)))
                                                  .toList(),
                                            );
                                          }))
                                ],
                              ),
                            )
                          ]),
                        )),
                    if (profileLoading.data ??
                        false || updateProfile.data == true)
                      const Center(
                        child: CircularProgressIndicator(),
                      )
                  ],
                );
              });
        });
  }

  Padding prefilledInfo(
      {BuildContext? context,
      String? text,
      String? initialValue,
      Function(String)? onChanged,
      int? maxLines}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            width: MediaQuery.of(context!).size.width / 3.5,
            child: Text(
              text!,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Expanded(
              child: TextFormField(
            onChanged: onChanged,
            minLines: 1,
            maxLines: maxLines,
            initialValue: initialValue,
          ))
        ],
      ),
    );
  }
}

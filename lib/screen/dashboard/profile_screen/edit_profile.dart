import 'package:flutter/material.dart';
import 'package:own_projeccts/screen/dashboard/chat/fake_chats_model.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key, this.onlineUsers}) : super(key: key);
final List<Friends>? onlineUsers;
  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  var list = ["Male", "Female"];

  String dropDownValue = "Male";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  onPressed: () {}),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  shape: BoxShape.circle),
              child: const Icon(
                Icons.person,
              ),
            ),
            TextButton(
                onPressed: () {}, child: const Text("Change Profile Photo")),
            prefilledInfo(context: context, text: "Name", initialValue: "Xyz"),
            prefilledInfo(
                context: context, text: "Username", initialValue: "xyz_test"),
            prefilledInfo(
                context: context, text: "Website", initialValue: "Website"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width / 3.5,
                      child: const Text("Bio")),
                  const Expanded(
                    child: Text(
                      "This is  bio section where user can add the bio and their intrest accordingly",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                  onPressed: () {},
                  child: const Text("Switch to Professional Account")),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: const Text(
                "Private Information",
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
              ),
            ),
            prefilledInfo(
                context: context, text: "Email", initialValue: "abc@gmail.com"),
            prefilledInfo(
                context: context, text: "Phone", initialValue: "+91845637454"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width / 3.5,
                      child: const Text("Gender")),
                  Expanded(
                      child: DropdownButtonFormField<String>(
                    value: dropDownValue,
                    onChanged: (value) {
                      dropDownValue = value!;
                      setState(() {});
                    },
                    items: list
                        .map((e) =>
                            DropdownMenuItem<String>(value: e, child: Text(e)))
                        .toList(),
                  ))
                ],
              ),
            )
          ]),
        ));
  }

  Padding prefilledInfo(
      {BuildContext? context, String? text, String? initialValue}) {
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
            initialValue: initialValue,
          ))
        ],
      ),
    );
  }
}

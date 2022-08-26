import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:own_projeccts/bloc/auth_bloc.dart';
import 'package:own_projeccts/bloc/post-bloc.dart';
import 'package:own_projeccts/model/user_model.dart';
import 'package:own_projeccts/screen/dashboard/stories/post_screen.dart';

class AddStories extends StatelessWidget {
  AddStories({Key? key, this.users}) : super(key: key);
  final Users? users;
  final postBloc = PostBloc();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () async {
            final pickedFile =
                await postBloc.pickPost(imageSource: ImageSource.gallery,context: context);
            if (pickedFile != null) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  PostScreen(imageFile:pickedFile, postBloc:postBloc),
                  ));
            }
          },
          child: SizedBox(
            height: 62,
            width: 62,
            child: Stack(
              children: [
                CircularProfileAvatar(
                  users?.profileUri ?? "",
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(users?.profileUri ?? ""),
                  ),
                  borderColor: Colors.green.shade200,
                  borderWidth: 3,
                  elevation: 0,
                  radius: 80,
                ),
                Positioned(
                  bottom: 0,
                  right: -5,
                  child: Icon(
                    Icons.add,
                    size: 40,
                    color: Colors.blue.shade100,
                  ),
                )
              ],
            ),
          ),
        ),
        Text(users?.firstName ?? "")
      ],
    );
  }
}

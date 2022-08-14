import 'package:flutter/material.dart';

class HighLightedPosts extends StatelessWidget {
  const HighLightedPosts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              shape: BoxShape.circle, border: Border.all(color: Colors.black)),
          child: const Icon(
            Icons.person,
            color: Colors.black,
            size: 35,
          ),
        ),
        const Text("name")
      ],
    );
  }
}

class NewHighLightedPost extends StatelessWidget {
  const NewHighLightedPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              shape: BoxShape.circle, border: Border.all(color: Colors.black)),
          child: const Icon(
            Icons.add,
            color: Colors.black,
            size: 35,
          ),
        ),
        const Text("New")
      ],
    );
  }
}

import 'package:flutter/material.dart';

class StoriesView extends StatelessWidget {
  const StoriesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: const EdgeInsets.all(9),
        itemCount: 20,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Column(
            children: const [
              CircleAvatar(
                radius: 30,
                child: Text("S"),
              ),
              SizedBox(
                width: 8,
              ),
              Text("Name"),
            ],
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            width: 5,
          );
        });
  }
}

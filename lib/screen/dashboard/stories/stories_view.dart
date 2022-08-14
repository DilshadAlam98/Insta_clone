import 'package:flutter/material.dart';
import 'package:own_projeccts/screen/dashboard/stories/add_stories.dart';
import 'package:own_projeccts/screen/dashboard/stories/dummy_story_data.dart';
import 'package:own_projeccts/screen/dashboard/stories/stories_detail.dart';
import 'package:status_view/status_view.dart';

class StoriesView extends StatelessWidget {
  final List<Map<String, String>> storiesList;

  const StoriesView({Key? key, required this.storiesList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var list = List.generate(
        10,
        (index) => UserModel([
              StoryModel(
                  "https://images.unsplash.com/photo-1609418426663-8b5c127691f9?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyNXx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
            ], "Users $index",
                "https://images.unsplash.com/photo-1609418426663-8b5c127691f9?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyNXx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"));

    sampleUsers.addAll(list);
    return Container(
      alignment: Alignment.centerLeft,
      height: 95,
      child: ListView.separated(
          padding: const EdgeInsets.all(9),
          itemCount: sampleUsers.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            if (index == 0) {
              return const AddStories();
            }
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => StoriesViewDetail()));
              },
              child: Column(
                children: [
                  StatusView(
                    radius: 30,
                    spacing: 10,
                    strokeWidth: 2,
                    indexOfSeenStatus: 2,
                    numberOfStatus: sampleUsers[index].stories.length,
                    padding: 4,
                    centerImageUrl: sampleUsers[index].imageUrl,
                    seenColor: Colors.grey,
                    unSeenColor: Colors.blue,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(sampleUsers[index].userName),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              width: 10,
            );
          }),
    );
  }
}

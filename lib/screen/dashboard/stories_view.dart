import 'package:flutter/material.dart';

class StoriesView extends StatelessWidget {
  final List<Map<String, String>> storiesList;
  const StoriesView({Key? key,required this.storiesList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 95,
      child: ListView.separated(
          padding: const EdgeInsets.all(9),
          itemCount: storiesList.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Column(
              children:  [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(storiesList[index]['image']!),
                ),
               const SizedBox(
                  width: 8,
                ),
                Text(storiesList[index]['name']!),
              ],
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(width: 10,);
          }),
    );
  }
}

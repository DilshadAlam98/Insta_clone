import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:own_projeccts/screen/dashboard/search_screen/fake_data.dart';


class PostGrid extends StatelessWidget {
  const PostGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MasonryGridView.builder(
          gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemCount: images.length,
          shrinkWrap: true,
          crossAxisSpacing: 0.8,
          mainAxisSpacing: 0.8,
          itemBuilder: (context, index) {
            return SizedBox(
              height: Random().nextInt(200) + 100.5,
              child: Image.network(
                images[index],
                fit: BoxFit.cover,
              ),
            );
          }),
    );
  }
}

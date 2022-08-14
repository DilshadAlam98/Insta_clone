import 'package:flutter/material.dart';
import 'package:own_projeccts/screen/dashboard/search_screen/fake_data.dart';

class AddStories extends StatelessWidget {
  const AddStories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {},
          child: SizedBox(
            height: 60,
            width: 60,
            child: Stack(
              fit: StackFit.expand,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(
                    storiesList[0]['image']!,
                    fit: BoxFit.cover,
                  ),
                ),
                const Align(
                  alignment: Alignment.bottomRight,
                  child: Icon(
                    Icons.add,
                    size: 40,
                    color: Colors.blue,
                  ),
                )
              ],
            ),
          ),
        ),
        const Text("Name")
      ],
    );
  }
}

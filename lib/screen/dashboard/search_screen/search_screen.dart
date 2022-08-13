import 'package:flutter/material.dart';
import 'package:own_projeccts/screen/dashboard/search_screen/button.dart';
import 'package:own_projeccts/screen/dashboard/search_screen/post_grid.dart';
import 'package:own_projeccts/widget/insta_input_field.dart';

import 'fake_data.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: InstaInputField(
                        prefix: Icons.search,
                        contentPadding: 10,
                        borderRadius: BorderRadius.circular(8),
                        hintText: "Search",
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Image.asset(
                      "assets/Shape.png",
                      height: 25,
                      width: 25,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 37,
                child: ListView.separated(
                  itemCount: buttonMap.length,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 9),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Button(
                      text: buttonMap[index]['text'],
                      image: buttonMap[index]['image'],
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 10,
                  ),
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              const PostGrid()
            ]),
          ),
        ),
      ),
    );
  }
}

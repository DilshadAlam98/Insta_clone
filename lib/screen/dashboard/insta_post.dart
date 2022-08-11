import 'package:flutter/material.dart';
import 'package:own_projeccts/screen/dashboard/image_slider.dart';

import '../../utils/app_colors.dart';

class InstaPost extends StatelessWidget {
  const InstaPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        padding: const EdgeInsets.all(9),
        itemCount: 40,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Row(
                children: const [
                  CircleAvatar(
                    radius: 20,
                    child: Text("I"),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text("name\nlocation"),
                  Spacer(),
                  Icon(Icons.more_horiz)
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Column(
                children: [
                  const ImageSlider(),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 15,
                        child: Text("I"),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      RichText(
                        text: const TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Liked by ',
                                style: TextStyle(
                                    color: grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400)),
                            TextSpan(
                                text: "Name ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600)),
                            TextSpan(
                                text: 'and ',
                                style: TextStyle(
                                    color: grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400)),
                            TextSpan(
                                text: "450 others ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  RichText(
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    text: const TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Name ',
                            style: TextStyle(
                                color: grey,
                                fontSize: 16,
                                fontWeight: FontWeight.w600)),
                        TextSpan(
                            text:
                                "In publishing and g to demcumeonstrate the visual form of a doonstrate the visual form of a doonstrate the visual form of a doonstrate the visual form of a dont",
                            style: TextStyle(
                                color: grey,
                                fontSize: 14,
                                fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "October 15",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 11, fontWeight: FontWeight.w400),
                      ))
                ],
              )
            ],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
          height: 15,
        ),
      ),
    );
  }
}

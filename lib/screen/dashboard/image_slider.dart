import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({Key? key}) : super(key: key);

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  @override
  Widget build(BuildContext context) {
    int _dotindicatoR = 0;

    List<String> imgList = List.generate(
        3,
        (index) =>
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQBoT8aT2n5ep_sg3C05vQxAg7Qy_XruE03NA&usqp=CAU");

    return Column(children: [
      CarouselSlider(
        options: CarouselOptions(
            autoPlay: false,
            aspectRatio: 16 / 9,
            enlargeCenterPage: true,
            height: 360,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              print('index ${index}');
              setState(() {
                _dotindicatoR = index;
                print('_current ${_dotindicatoR}');
              });
            }),
        items: imgList
            .map((e) => SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2,
                  child: Image.network(
                    e,
                    fit: BoxFit.cover,
                  ),
                ))
            .toList(),
      ),
      Row(
        children: [
          Image.asset(
            "assets/heart.png",
            width: 24,
            height: 21,
          ),
          const SizedBox(
            width: 10,
          ),
          Image.asset(
            "assets/Comment.png",
            width: 24,
            height: 21,
          ),
          const SizedBox(
            width: 10,
          ),
          Image.asset(
            "assets/Messanger.png",
            width: 24,
            height: 21,
          ),
          const Spacer(),
          SizedBox(
            height: 30,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: imgList.length,
                itemBuilder: (context, i) {
                  return Container(
                    width: 8.0,
                    height: 8.0,
                    margin: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _dotindicatoR == i
                          ? const Color(0xff01a8dd)
                          : const Color.fromRGBO(0, 0, 0, 0.4),
                    ),
                  );
                }),
          ),
          const Spacer(),

          // sizebox 42 width will fix later
          const SizedBox(
            width: 42,
          ),
          Image.asset(
            "assets/Save.png",
            width: 24,
            height: 21,
          ),
        ],
      ),
    ]);
  }
}

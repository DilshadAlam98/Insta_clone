import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String? text;
  final String? image;

  const Button({Key? key, this.text, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            side: BorderSide(color: Colors.black.withOpacity(0.3))),
        onPressed: () {},
        child: Row(
          children: [
            image != null
                ? Image.asset(
                    image!,
                    height: 18,
                    width: 25,
                    color: Colors.black,
                  )
                : Container(),
            const SizedBox(
              width: 5,
            ),
            Text(
              text!,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ));
  }
}

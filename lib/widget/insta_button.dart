import 'package:flutter/material.dart';
import 'package:own_projeccts/utils/app_colors.dart';

class InstaButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;

  const InstaButton({Key? key, required this.onPressed, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(5),
      ),
      height: 44,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        child: child,
        onPressed: onPressed,
      ),
    );
  }
}

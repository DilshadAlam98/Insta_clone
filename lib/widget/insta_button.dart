import 'package:flutter/material.dart';
import 'package:own_projeccts/utils/app_colors.dart';

class InstaButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final Color? color;
  final double? hight;
  final double? width;
  final double? circular;

  const InstaButton(
      {Key? key,
      required this.onPressed,
      required this.child,
      this.color,
      this.hight,
      this.circular,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color ?? buttonColor,
        borderRadius: BorderRadius.circular(circular ?? 5),
      ),
      height: hight ?? 44,
      width: width ?? MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: color,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(circular ?? 0))),
        child: child,
        onPressed: onPressed,
      ),
    );
  }
}

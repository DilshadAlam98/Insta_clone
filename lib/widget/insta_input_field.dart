import 'package:flutter/material.dart';

class InstaInputField extends StatelessWidget {
  final String? initialValue;
  final String? hintText;
  final String? labelText;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final BorderRadius? borderRadius;
  final double? contentPadding;
  final IconData? prefix;
  final int? maxLines;

  const InstaInputField(
      {Key? key,
      this.initialValue,
      this.contentPadding,
      this.prefix,
      this.labelText,
      this.onChanged,
      this.controller,
      this.borderRadius,
      this.hintText,
      this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines??1,
      initialValue: initialValue,
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(contentPadding ?? 15),
        prefixIcon: Icon(
          prefix,
          color: Colors.black,
        ),
        hintText: hintText,
        labelText: labelText,
        fillColor: Colors.grey.shade100,
        filled: true,
        border: OutlineInputBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(0),
            borderSide: BorderSide(color: Colors.black)),
      ),
    );
  }
}

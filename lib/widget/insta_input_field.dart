import 'package:flutter/material.dart';

class InstaInputField extends StatelessWidget {
  final String? initialValue;
  final String? hintText;
  final String? labelText;
  final Function(String)? onChanged;
  final TextEditingController? controller;

  const InstaInputField(
      {Key? key,
      this.initialValue,
      this.labelText,
      this.onChanged,
      this.controller,
      this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(15),
        hintText: hintText,
        labelText: labelText,
        fillColor: Colors.grey.shade100,
        filled: true,
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black)),
      ),
    );
  }
}

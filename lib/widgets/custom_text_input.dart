import 'package:flutter/material.dart';
import 'package:food/constants/helpers.dart';

class CustomTextInput extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final IconData icon;
  const CustomTextInput(
      {Key? key,
      required this.controller,
      required this.icon,
      required this.labelText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: Helpers.foodorange600,
              width: 2.0,
            )),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class BigTextWidget extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  const BigTextWidget(
      {Key? key,
      required this.text,
      this.size = 16,
      this.color = Colors.black87})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color, fontSize: size),
    );
  }
}

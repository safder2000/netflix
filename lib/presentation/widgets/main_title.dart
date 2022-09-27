import 'package:flutter/material.dart';

class MainTitle extends StatelessWidget {
  MainTitle({Key? key, required this.title}) : super(key: key);
  String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
    );
  }
}

import 'package:flutter/material.dart';

class SearchTextTitle extends StatelessWidget {
  SearchTextTitle({Key? key, required this.title}) : super(key: key);
  String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:netflix_app/core/constants.dart';

class MainCard extends StatelessWidget {
  final String posterUrl;
  const MainCard({
    Key? key,
    required this.posterUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        width: 114,
        decoration: BoxDecoration(
            borderRadius: Radius_5,
            color: Color.fromARGB(255, 59, 59, 59),
            image: DecorationImage(
                fit: BoxFit.cover, image: NetworkImage(posterUrl))),
      ),
    );
  }
}

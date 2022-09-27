import 'package:flutter/material.dart';
import 'package:netflix_app/core/constants.dart';

class MainCard extends StatelessWidget {
  const MainCard({
    Key? key,
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
            image: const DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/4CgMd3q8vy4bodVqS2Mp9epORmU.jpg'))),
      ),
    );
  }
}

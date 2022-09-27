import 'package:flutter/material.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:bordered_text/bordered_text.dart';

class NumberCard extends StatelessWidget {
  final int index;
  const NumberCard({
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            SizedBox(
              width: 35,
            ),
            Container(
              height: 180,
              width: 114,
              decoration: BoxDecoration(
                  borderRadius: Radius_5,
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/4CgMd3q8vy4bodVqS2Mp9epORmU.jpg'))),
            ),
          ],
        ),
        Positioned(
          left: 10,
          bottom: -9,
          child: BorderedText(
            strokeWidth: 2.0,
            strokeColor: Colors.white,
            child: Text(
              '${index + 1}',
              style: TextStyle(
                color: Colors.black,
                fontSize: 120,
                fontWeight: FontWeight.w900,
                decorationColor: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

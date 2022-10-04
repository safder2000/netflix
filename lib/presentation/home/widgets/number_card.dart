import 'package:flutter/material.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:bordered_text/bordered_text.dart';

class NumberCard extends StatelessWidget {
  final int index;
  final String imageUrl;
  const NumberCard({
    required this.index,
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            SizedBox(
              width: 20,
            ),
            Container(
              height: 170,
              width: 104,
              decoration: BoxDecoration(
                  borderRadius: Radius_5,
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(imageUrl))),
            ),
          ],
        ),
        Positioned(
          left: -15,
          bottom: 0,
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
        Container(
          height: 170,
          width: 104,
          // Below is the code for Linear Gradient.
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(141, 0, 0, 0),
                Color.fromARGB(0, 33, 149, 243)
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        )
      ],
    );
  }
}

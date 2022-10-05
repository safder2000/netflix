import 'package:flutter/material.dart';

import '../../../core/colors.dart';
import '../../../core/constants.dart';
import '../../widgets/icon_button_widget.dart';

class EveryoneWatching extends StatelessWidget {
  final String posterPath;
  final String movieName;
  final String description;

  const EveryoneWatching(
      {super.key,
      required this.posterPath,
      required this.movieName,
      required this.description});

  @override
  Widget build(BuildContext context) {
    final srcWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: srcWidth,
      // height: srcWidth * 1.05,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    posterPath,
                  ),
                ),
              ),
              width: srcWidth,
              height: srcWidth * 0.56,
            ),
            Positioned(
              right: 10,
              bottom: 15,
              child: CircleAvatar(
                radius: 15,
                backgroundColor: Colors.black26,
                child: Icon(
                  Icons.volume_mute_outlined,
                  color: whiteColor,
                ),
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 200,
                    child: Text(
                      movieName,
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  IconButtonwidget(
                    title: 'Share',
                    icon: Icons.share,
                    fontSize: 9,
                    iconSize: 25,
                    fontColor: grayColor,
                    iconColor: Colors.grey.shade200,
                  ),
                  IconButtonwidget(
                    title: 'My List',
                    iconSize: 29,
                    icon: Icons.check,
                    fontSize: 9,
                    fontColor: grayColor,
                    iconColor: Colors.grey.shade200,
                  ),
                  IconButtonwidget(
                    title: 'Play',
                    iconSize: 31,
                    icon: Icons.play_arrow,
                    fontSize: 9,
                    fontColor: grayColor,
                    iconColor: Colors.grey.shade200,
                  ),
                ],
              ),
              height_10,
              height_10,
              Text(
                description,
                style: hotnNewTabText,
                maxLines: 5,
              ),
              height_10,
              // Text(
              //   'Deadpan . Rousing . Superhero . Superpower . Japanese',
              //   style:
              //       TextStyle(fontSize: 12, color: Colors.white, height: 1.7),
              // ),
            ],
          ),
        ),
      ]),
    );
  }
}

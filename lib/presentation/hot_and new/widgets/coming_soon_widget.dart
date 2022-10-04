import 'package:flutter/material.dart';

import '../../../core/colors.dart';
import '../../../core/constants.dart';
import '../../widgets/icon_button_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  final String id;
  final String month;
  final String day;
  final String posterPath;
  final String movieName;
  final String description;

  const ComingSoonWidget(
      {super.key,
      required this.id,
      required this.month,
      required this.day,
      required this.posterPath,
      required this.movieName,
      required this.description});

  @override
  Widget build(BuildContext context) {
    final srcWidth = MediaQuery.of(context).size.width;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: srcWidth * 0.15,
          child: Column(children: [
            Text(month,
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade200)),
            Text(
              day,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            )
          ]),
        ),
        SizedBox(
          width: srcWidth * 0.85,
          height: srcWidth * 1.1,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                  width: srcWidth * 0.85,
                  height: srcWidth * 0.45,
                ),
                const Positioned(
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
            height_10,
            Row(
              children: [
                SizedBox(
                  width: 200,
                  child: Text(
                    movieName,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 35,
                        letterSpacing: -5,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const Spacer(),
                IconButtonwidget(
                  title: 'Remind Me',
                  icon: Icons.notifications_none_outlined,
                  fontSize: 9,
                  iconSize: 25,
                  fontColor: grayColor,
                  iconColor: Colors.grey.shade200,
                ),
                width_10,
                width_10,
                IconButtonwidget(
                  title: 'info',
                  iconSize: 25,
                  icon: Icons.info_outline,
                  fontSize: 9,
                  fontColor: grayColor,
                  iconColor: Colors.grey.shade200,
                ),
                width_10,
                width_10,
              ],
            ),
            height_10,
            height_10,
            height_10,
            Text(
              'Season Coming On $day $month',
              style: hotnNewTabTitle,
            ),
            height_10,
            Text(
              description,
              style: hotnNewTabText,
              maxLines: 4,
            ),
          ]),
        ),
      ],
    );
  }
}

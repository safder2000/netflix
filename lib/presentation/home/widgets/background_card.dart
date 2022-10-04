import 'package:flutter/material.dart';

import '../../../core/colors.dart';
import '../../widgets/icon_button_widget.dart';

class BackgroundCard extends StatelessWidget {
  const BackgroundCard({
    Key? key,
    required this.srcWidth,
    required this.ImageUrl,
  }) : super(key: key);

  final double srcWidth;
  final String ImageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: srcWidth * 1.4,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(ImageUrl),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: srcWidth * 1.4,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(0, 0, 0, 0),
              Color.fromARGB(0, 0, 0, 0),
              Color.fromARGB(255, 0, 0, 0),
            ],
          )),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButtonwidget(title: 'My List', icon: Icons.add),
                _playButton(),
                IconButtonwidget(title: 'info', icon: Icons.info_outline),
              ],
            ),
          ),
        )
      ],
    );
  }

  SizedBox _playButton() {
    return SizedBox(
      width: 100,
      height: 40,
      child: TextButton.icon(
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            )),
            backgroundColor: MaterialStateProperty.all(whiteColor)),
        icon: const Icon(
          Icons.play_arrow,
          color: blackColor,
          size: 28,
        ),
        onPressed: () {},
        label: const Padding(
          padding: EdgeInsets.only(right: 5.0),
          child: Text(
            'Play',
            style: TextStyle(
                color: blackColor, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

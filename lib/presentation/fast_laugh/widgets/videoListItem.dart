import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors.dart';

class VideoListItem extends StatelessWidget {
  final int index;
  VideoListItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.accents[index % Colors.accents.length],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 17),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.volume_mute_outlined,
                    color: whiteColor,
                    size: 35,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                            'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/iOmEjLGuNb4v03hUtIJZFQWxdG9.jpg'),
                      ),
                    ),
                    VideoActionWidgets(
                      icon: Icons.emoji_emotions,
                      title: 'LOL',
                    ),
                    VideoActionWidgets(
                      icon: Icons.add,
                      title: 'My List',
                    ),
                    VideoActionWidgets(
                      icon: Icons.share,
                      title: 'Share',
                    ),
                    VideoActionWidgets(
                      icon: Icons.play_arrow,
                      title: 'Play',
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class VideoActionWidgets extends StatelessWidget {
  final IconData icon;
  final String title;
  const VideoActionWidgets(
      {super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Column(
        children: [
          Icon(
            icon,
            color: whiteColor,
            size: 28,
          ),
          Text(title)
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:netflix_app/core/colors.dart';
import 'package:netflix_app/core/constants.dart';

import 'package:netflix_app/presentation/widgets/main_title_card.dart';

import '../widgets/profilePic.dart';
import 'widgets/background_card.dart';
import 'widgets/number_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    final srcWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: scrollNotifier,
        builder: (BuildContext context, index, _) {
          return NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              final ScrollDirection direction = notification.direction;
              if (direction == ScrollDirection.reverse) {
                scrollNotifier.value = false;
              }
              if (direction == ScrollDirection.forward) {
                scrollNotifier.value = true;
              }
              return true;
            },
            child: Stack(
              children: [
                ListView(
                  children: [
                    BackgroundCard(srcWidth: srcWidth),
                    MainTitleCard(
                      title: 'My List',
                    ),
                    NumberTileCard(),
                    MainTitleCard(
                      title: 'Popular On Netflix',
                    ),
                    MainTitleCard(
                      title: 'Trending Now',
                    ),
                    MainTitleCard(
                      title: 'Action & Adventure',
                    ),
                  ],
                ),
                Column(
                  children: [
                    scrollNotifier.value
                        ? AnimatedContainer(
                            duration: const Duration(microseconds: 1000),
                            width: double.infinity,
                            height: 50,
                            color: Colors.black54,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: SizedBox(
                                    height: 45,
                                    child: Image.network(
                                        'https://pngimg.com/uploads/netflix/netflix_PNG15.png'),
                                  ),
                                ),
                                const Spacer(),
                                const Icon(
                                  CupertinoIcons.search,
                                  color: whiteColor,
                                  size: 26,
                                ),
                                width_10,
                                width_10,
                                const ProfilePick(),
                              ]),
                            ),
                          )
                        : const SizedBox(),
                    AnimatedContainer(
                      duration: const Duration(microseconds: 1000),
                      width: double.infinity,
                      height: 55,
                      color: scrollNotifier.value
                          ? Colors.black54
                          : Colors.black87,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'TV Shows',
                            style: homeTitleText,
                          ),
                          Text('Movies', style: homeTitleText),
                          Row(
                            children: [
                              Text('Categories', style: homeTitleText),
                              Icon(
                                Icons.arrow_drop_down,
                                color: whiteColor,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

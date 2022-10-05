import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/core/colors.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/presentation/widgets/catogories.dart';

import 'package:netflix_app/presentation/widgets/main_title_card.dart';

import '../../application/hot_and_new/hot_and_new_bloc.dart';
import '../widgets/profilePic.dart';
import 'widgets/background_card.dart';
import 'widgets/number_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    final srcWidth = MediaQuery.of(context).size.width;
    BlocProvider.of<HotAndNewBloc>(context).add(const LoadedDataInComingSoon());
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
                BlocBuilder<HotAndNewBloc, HotAndNewState>(
                  builder: (context, state) {
                    if (state.isLoading) {
                      return const Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.red,
                        ),
                      );
                    } else if (state.hasError) {
                      return const Center(
                        child: Text('Error while loading ComingSoon list'),
                      );
                    } else if (state.comingSoonList.isEmpty) {
                      return const Center(
                        child: Text('ComingSoon list is empty'),
                      );
                    } else {
                      final list = state.comingSoonList;
                      list.shuffle;

                      return ListView(
                        children: [
                          BackgroundCard(
                            srcWidth: srcWidth,
                            ImageUrl:
                                '$imageAppendUrl${state.comingSoonList[4].posterPath}' ??
                                    'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/tVxDe01Zy3kZqaZRNiXFGDICdZk.jpg',
                          ),
                          MainTitleCard(
                            title: 'My List',
                            MovieList: list,
                          ),
                          NumberTileCard(
                            movieList: list,
                          ),
                          MainTitleCard(
                            title: 'Popular On Netflix',
                            MovieList: list,
                          ),
                          MainTitleCard(
                            title: 'Trending Now',
                            MovieList: list,
                          ),
                          MainTitleCard(
                            title: 'Action & Adventure',
                            MovieList: list,
                          ),
                        ],
                      );
                    }
                  },
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
                          GestureDetector(
                            onTap: () {
                              var dialog = CustomAlertDialog(
                                  message:
                                      "Are you sure, do you want to logout?",
                                  onPostivePressed: () {},
                                  positiveBtnText: 'Yes',
                                  negativeBtnText: 'No');
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) => dialog);
                            },
                            child: Row(
                              children: [
                                Text('Categories', style: homeTitleText),
                                Icon(
                                  Icons.arrow_drop_down,
                                  color: whiteColor,
                                )
                              ],
                            ),
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

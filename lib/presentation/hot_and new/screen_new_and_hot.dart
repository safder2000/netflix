import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/application/hot_and_new/hot_and_new_bloc.dart';
import 'package:netflix_app/core/colors.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/presentation/hot_and%20new/widgets/coming_soon_widget.dart';
import 'package:netflix_app/presentation/hot_and%20new/widgets/everyone_watching.dart';

import '../widgets/app_bar_widget.dart';
import '../widgets/icon_button_widget.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    final srcWidth = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarWidget(
            icon: Icons.notifications,
            title: 'New & Hot',
          ),
        ),
        body: Column(
          children: [
            height_10,
            SizedBox(
              height: 35,
              child: TabBar(
                labelColor: blackColor,
                unselectedLabelColor: whiteColor,
                labelStyle:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                indicator: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(50),
                ),
                tabs: [
                  Tab(
                    text: '🍿Coming Soon',
                  ),
                  Tab(
                    text: "🔥Everyone's watching",
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(children: [
                const ComingSoonList(key: Key('coming_soon')),
                SizedBox()

                // _buildTabBarView('2', srcWidth),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  // _buildTabBarView(String name, srcWidth) {
  //   return ListView.builder(
  //       itemCount: 10,
  //       itemBuilder: (BuildContext context, index) => const EveryoneWatching());
  // }
}

class ComingSoonList extends StatelessWidget {
  const ComingSoonList({super.key});

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance!.addPersistentFrameCallback((_) {
    //   BlocProvider.of<HotAndNewBloc>(context)
    //       .add(const LoadedDataInComingSoon());
    // });
    BlocProvider.of<HotAndNewBloc>(context).add(const LoadedDataInComingSoon());
    return BlocBuilder<HotAndNewBloc, HotAndNewState>(
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
          return ListView.builder(
              itemCount: state.comingSoonList.length,
              itemBuilder: (BuildContext context, index) {
                final movie = state.comingSoonList[index];
                if (movie.id == null) {
                  return SizedBox();
                }
                return ComingSoonWidget(
                    id: movie.id.toString(),
                    month: 'MAR',
                    day: "11",
                    posterPath: '$imageAppendUrl${movie.backdropPath}',
                    movieName: movie.title ?? 'No title',
                    description: movie.overview ?? 'No Overview');
              });
        }
      },
    );
  }
}

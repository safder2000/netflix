import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/presentation/new_and_hot/widgets/coming_soon_widget.dart';
import 'package:netflix_app/presentation/new_and_hot/widgets/everyone_watching.dart';

import '../widgets/app_bar_widget.dart';
import '../widgets/icon_button_widget.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    final srcWidth = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarWidget(
            icon: Icons.notifications,
            title: 'New & Hot',
          ),
        ),
        body: Column(children: [
          SizedBox(
            height: 35,
            child: TabBar(
              isScrollable: true,
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
                Tab(
                  text: '📺Top 10 TV Shows',
                ),
                Tab(
                  text: '🎞️Top 10 TV Movies',
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(children: [
              _buildTabBarView('1', srcWidth),
              _buildTabBarView('2', srcWidth),
              _buildTabBarView('3', srcWidth),
              _buildTabBarView('4', srcWidth),
            ]),
          )
        ]),
      ),
    );
  }

  _buildTabBarView(String name, srcWidth) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, index) => const EveryoneWatching());
  }
}

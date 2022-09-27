import 'package:flutter/material.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/presentation/widgets/main_title.dart';

import 'main_card.dart';

class MainTitleCard extends StatelessWidget {
  final String title;
  MainTitleCard({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 13),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: MainTitle(title: title),
          ),
          height_10,
          LimitedBox(
            maxHeight: 180,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(10, (index) => const MainCard()),
            ),
          )
        ],
      ),
    );
  }
}

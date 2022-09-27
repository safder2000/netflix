import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../../widgets/main_title.dart';
import 'number_card.dart';

class NumberTileCard extends StatelessWidget {
  NumberTileCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: MainTitle(title: 'Top 10 TV Shows in India Today'),
          ),
          height_10,
          LimitedBox(
            maxHeight: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                10,
                (index) => NumberCard(
                  index: index,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

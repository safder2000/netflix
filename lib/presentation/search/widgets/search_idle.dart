import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:netflix_app/core/colors.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/presentation/search/widgets/title.dart';

const imageUrl =
    'https://www.themoviedb.org/t/p/w533_and_h300_bestv2/84XPpjGvxNyExjSuLQe0SzioErt.jpg';

class SearchIdle extends StatelessWidget {
  const SearchIdle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchTextTitle(
            title: " Top Searches",
          ),
          height_10,
          Expanded(
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: ((context, index) => const TopSeacrchItem()),
                separatorBuilder: ((context, index) => height_10),
                itemCount: 10),
          )
        ],
      ),
    );
  }
}

class TopSeacrchItem extends StatelessWidget {
  const TopSeacrchItem({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          height: 65,
          width: screenWidth * 0.3,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(imageUrl),
            ),
          ),
        ),
        width_10,
        const Expanded(
          child: Text(
            'Movie Name',
            style: TextStyle(
              color: whiteColor,
              fontSize: 15,
            ),
          ),
        ),
        const CircleAvatar(
          backgroundColor: whiteColor,
          radius: 13,
          child: CircleAvatar(
            backgroundColor: blackColor,
            radius: 12,
            child: Icon(
              Icons.play_arrow,
              color: whiteColor,
              size: 20,
            ),
          ),
        ),
        width_10
      ],
    );
  }
}

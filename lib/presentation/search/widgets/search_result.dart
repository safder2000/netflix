import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/presentation/search/widgets/title.dart';

const _imageUrl =
    'https://www.themoviedb.org/t/p/w220_and_h330_face/ggFHVNu6YYI5L9pCfOacjizRGt.jpg';

class SearchResult extends StatelessWidget {
  const SearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchTextTitle(
            title: 'Movies & TV',
          ),
          height_10,
          Expanded(
            child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 9,
              childAspectRatio: 1.1 / 1.5,
              children: List.generate(
                20,
                (index) {
                  return const MainCard();
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MainCard extends StatelessWidget {
  const MainCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          image: const DecorationImage(
              fit: BoxFit.cover, image: NetworkImage(_imageUrl))),
    );
  }
}

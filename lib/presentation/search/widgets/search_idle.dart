import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/application/search/search_bloc.dart';
import 'package:netflix_app/core/colors.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/presentation/search/widgets/title.dart';

// const imageUrl =
//     'https://www.themoviedb.org/t/p/w533_and_h300_bestv2/84XPpjGvxNyExjSuLQe0SzioErt.jpg';

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
            child: BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state.isError) {
                  return Center(
                    child: Text('Error while fetching data'),
                  );
                } else if (state.idleList.isEmpty) {
                  return const Center(
                    child: Text('No Results Found'),
                  );
                }
                return ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: ((context, index) {
                      final movie = state.idleList[index];
                      return TopSeacrchItem(
                        title: movie.title ?? 'No Title Provided',
                        imageUrl: '$imageAppendUrl${movie.bannerPath}',
                      );
                    }),
                    separatorBuilder: ((context, index) => SizedBox(
                          height: 2,
                        )),
                    itemCount: state.idleList.length);
              },
            ),
          )
        ],
      ),
    );
  }
}

class TopSeacrchItem extends StatelessWidget {
  TopSeacrchItem({super.key, required this.title, required this.imageUrl});
  final String title;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.white12,
      child: Row(
        children: [
          Container(
            height: 74,
            width: screenWidth * 0.3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(imageUrl),
              ),
            ),
          ),
          width_10,
          width_10,
          Expanded(
            child: Text(
              title,
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
      ),
    );
  }
}

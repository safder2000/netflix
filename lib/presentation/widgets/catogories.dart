import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/application/search/search_bloc.dart';
import 'package:netflix_app/core/colors.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/presentation/search/widgets/search_idle.dart';
import 'package:netflix_app/presentation/search/widgets/search_result.dart';

class CustomAlertDialog extends StatelessWidget {
  final Color bgColor;
  // final String title;
  final String message;
  final String positiveBtnText;
  final String negativeBtnText;
  final Function onPostivePressed;
  // final Function onNegativePressed;
  final double circularBorderRadius;

  CustomAlertDialog({
    // required this.title,
    required this.message,
    this.circularBorderRadius = 15.0,
    this.bgColor = Colors.white,
    required this.positiveBtnText,
    required this.negativeBtnText,
    required this.onPostivePressed,
    // required this.onNegativePressed,
  })  : assert(bgColor != null),
        assert(circularBorderRadius != null);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // title: title != null ? Text(title) : null,
      content: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {},
            child: Text(
              'Available for Download',
              style: catagoriesTextStyle,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CatogoryPage(
                          value: 'cartoon',
                        )),
              );
            },
            child: Text(
              'Anime',
              style: catagoriesTextStyle,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CatogoryPage(
                          value: 'indian',
                        )),
              );
            },
            child: Text(
              'Indian',
              style: catagoriesTextStyle,
            ),
          ),
          Text(
            'International',
            style: catagoriesTextStyle,
          ),
          Text(
            'Romance',
            style: catagoriesTextStyle,
          ),
          Text(
            'Sci-Fi',
            style: catagoriesTextStyle,
          ),
          Text(
            'Thrillers',
            style: catagoriesTextStyle,
          ),
          Text(
            'Horror',
            style: catagoriesTextStyle,
          ),
          Text(
            'Hollywood',
            style: catagoriesTextStyle,
          ),
          Text(
            'Fantasy',
            style: catagoriesTextStyle,
          ),
          Text(
            'Reality&talk',
            style: catagoriesTextStyle,
          ),
        ],
      ),
      backgroundColor: Colors.black38,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(circularBorderRadius)),
      // actions: <Widget>[
      //   negativeBtnText != null
      //       ? TextButton(
      //           child: Text(negativeBtnText),
      //           textColor: Theme.of(context).accentColor,
      //           onPressed: () {
      //             Navigator.of(context).pop();
      //             if (onNegativePressed != null) {
      //               onNegativePressed();
      //             }
      //           },
      //         )
      //       : null,
      //   positiveBtnText != null
      //       ? FlatButton(
      //           child: Text(positiveBtnText),
      //           textColor: Theme.of(context).accentColor,
      //           onPressed: () {
      //             if (onPostivePressed != null) {
      //               onPostivePressed();
      //             }
      //           },
      //         )
      //       : null,
      // ],
    );
  }
}

class CatogoryPage extends StatelessWidget {
  CatogoryPage({super.key, required this.value});
  final String value;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<SearchBloc>(context).add(const Initialize());
      BlocProvider.of<SearchBloc>(context).add(SearchMovie(movieQuery: value));
    });
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          height_10,
          height_10,
          Expanded(child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state.searchResultList.isEmpty) {
                return const SearchIdle();
              } else {
                return SearchResult(
                  searchValue: value,
                );
              }
            },
          )),
        ],
      )),
    );
  }
}

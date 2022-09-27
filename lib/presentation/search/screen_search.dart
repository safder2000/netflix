import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/presentation/search/widgets/search_idle.dart';
import 'package:netflix_app/presentation/search/widgets/search_result.dart';

class ScreenSearch extends StatelessWidget {
  const ScreenSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 50,
            child: CupertinoSearchTextField(
              borderRadius: BorderRadius.circular(0),
              prefixIcon: const Icon(
                CupertinoIcons.search,
                color: Colors.white70,
              ),
              placeholder: 'Search for a show, mobie, genre, etc.',
              placeholderStyle:
                  const TextStyle(fontSize: 15, color: Colors.white70),
              suffixIcon: const Icon(
                CupertinoIcons.xmark,
                color: Colors.white70,
              ),
              style: const TextStyle(
                  color: Color.fromARGB(231, 255, 255, 255), fontSize: 15),
              backgroundColor: Color.fromARGB(181, 66, 66, 66),
            ),
          ),
          height_10,
          height_10,
          Expanded(child: SearchResult()),
        ],
      )),
    );
  }
}

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/application/downloads/downloads_bloc.dart';
import 'package:netflix_app/core/colors.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/presentation/widgets/app_bar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({super.key});
  final _WidgetList = const [SmartDownloads(), Section2(), Section3()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarWidget(
          icon: Icons.cast,
          title: 'Downloads',
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(10),
        itemBuilder: (ctx, index) => _WidgetList[index],
        itemCount: _WidgetList.length,
        separatorBuilder: (ctx, index) => const SizedBox(
          height: 20,
        ),
      ),
    );
  }
}

class Section2 extends StatelessWidget {
  const Section2({super.key});

  @override
  Widget build(BuildContext context) {
    final List imageList = [
      'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/iOmEjLGuNb4v03hUtIJZFQWxdG9.jpg',
      'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/bBqEiQbbfyt4MWR3NhDZMbS4Wp8.jpg',
      'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/7jSWOc6jWSw5hZ78HB8Hw3pJxuk.jpg'
    ];
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<DownloadsBloc>(context)
          .add(const DownloadsEvent.getDownloadsImages());
    });
    // BlocProvider.of<DownloadsBloc>(context)
    //     .add(const DownloadsEvent.getDownloadsImages());

    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Introducing Downloads for You',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        height_10,
        Text(
          "We'll download a personalised selection of movies and shows for you, so there's always somthing to watch on your phone.  ",
          style: TextStyle(fontSize: 13, color: grayColor),
        ),
        BlocBuilder<DownloadsBloc, DownloadsState>(
          builder: (context, state) {
            if (state.downloads.isEmpty) {
              print("List empty   ///////////////////");
            } else {
              print("List Not empty   XXXXXXXXXXXXXXXXXX");
            }
            return state.downloads.isEmpty
                ? SizedBox(
                    height: size.width * 0.9,
                    width: size.width,
                    child: const Center(
                        child: CircularProgressIndicator(
                      color: Colors.red,
                    )),
                  )
                : SizedBox(
                    height: size.width * 0.9,
                    width: size.width,
                    child: state.isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : Stack(
                            alignment: Alignment.center,
                            children: [
                              Center(
                                child: CircleAvatar(
                                  backgroundColor: buttonBlackColor,
                                  radius: size.width * 0.33,
                                ),
                              ),
                              downloadsImageWidget(
                                size: MediaQuery.of(context).size * 0.9,
                                imageList:
                                    '$imageAppendUrl${state.downloads[0].posterPath}',
                                // '${imageList[0]}',
                                margin: EdgeInsets.only(left: 150, top: 15),
                                angle: 18,
                                index: 0,
                              ),
                              downloadsImageWidget(
                                size: MediaQuery.of(context).size * 0.9,
                                imageList:
                                    //  '${imageList[1]}',
                                    '$imageAppendUrl${state.downloads[1].posterPath}',
                                margin: EdgeInsets.only(right: 150, top: 15),
                                angle: -18,
                                index: 1,
                              ),
                              downloadsImageWidget(
                                size: MediaQuery.of(context).size,
                                imageList:
                                    //  '${imageList[2]}',
                                    '$imageAppendUrl${state.downloads[2].posterPath}',
                                margin: EdgeInsets.only(right: 0),
                                angle: 0,
                                index: 2,
                              ),
                            ],
                          ),
                  );
          },
        ),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MaterialButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          color: buttonBlueColor,
          height: 45,
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {},
          child: Text(
            'Set Up',
            style: TextStyle(
                color: whiteColor, fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ),
        height_10,
        height_10,
        height_10,
        Center(
          child: MaterialButton(
            minWidth: 20,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
            color: buttonBlackColor,
            onPressed: () {},
            child: Text(
              'Find More to Download',
              style: TextStyle(
                  color: whiteColor, fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}

class SmartDownloads extends StatelessWidget {
  const SmartDownloads({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.settings,
          color: grayColor,
        ),
        width_10,
        Text(
          'Smart Downloads',
          style: TextStyle(color: grayColor),
        )
      ],
    );
  }
}

class downloadsImageWidget extends StatelessWidget {
  const downloadsImageWidget({
    Key? key,
    required this.imageList,
    required this.index,
    required this.margin,
    this.angle = 0,
    required this.size,
  }) : super(key: key);

  final String imageList;
  final int index;
  final double angle;
  final EdgeInsets margin;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Transform.rotate(
        angle: angle * pi / 180,
        child: Container(
          width: size.width * 0.34,
          height: size.width * 0.515,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(image: NetworkImage(imageList))),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/application/fast_laugh/fast_laugh_bloc.dart';
import 'package:netflix_app/core/colors.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/domain/downloads/models/downloads.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';

class VideoListItemInheritedWidget extends InheritedWidget {
  final Widget widget;
  final Downloads movieData;

  const VideoListItemInheritedWidget(
      {super.key, required this.widget, required this.movieData})
      : super(child: widget);
  @override
  bool updateShouldNotify(covariant VideoListItemInheritedWidget oldWidget) {
    return oldWidget.movieData != movieData;
  }

  static VideoListItemInheritedWidget? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<VideoListItemInheritedWidget>();
  }
}

class VideoListItem extends StatelessWidget {
  final int index;
  const VideoListItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final posterPath =
        VideoListItemInheritedWidget.of(context)?.movieData.posterPath;
    final videoUrl = dummyVideoUrls[index % dummyVideoUrls.length];
    return Stack(
      children: [
        // Container(
        //   color: Colors.accents[index % Colors.accents.length],
        // ),
        FastLaughVideoPlayer(videoUrl: videoUrl, onStateChanged: (bool) {}),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 17),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.volume_mute_outlined,
                    color: whiteColor,
                    size: 35,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: posterPath == null
                            ? null
                            : NetworkImage("$imageAppendUrl$posterPath"),
                      ),
                    ),
                    ValueListenableBuilder(
                      valueListenable: likeVideosIdsNotifier,
                      builder:
                          (BuildContext c, Set<int> newLikedList, Widget? _) {
                        final _index = index;
                        if (newLikedList.contains(_index)) {
                          return GestureDetector(
                            onTap: () {
                              likeVideosIdsNotifier.value.remove(_index);
                              likeVideosIdsNotifier.notifyListeners();
                              // BlocProvider.of<FastLaughBloc>(context)
                              //     .add(UnlikeVideo(id: _index));
                            },
                            child: const VideoActionWidgets(
                              icon: Icons.favorite,
                              title: 'LOL',
                            ),
                          );
                        }
                        return GestureDetector(
                          onTap: () {
                            likeVideosIdsNotifier.value.add(_index);
                            likeVideosIdsNotifier.notifyListeners();
                            // BlocProvider.of<FastLaughBloc>(context)
                            //     .add(LikeVideo(id: _index));
                          },
                          child: const VideoActionWidgets(
                            icon: Icons.favorite_border_outlined,
                            title: 'LOL',
                          ),
                        );
                      },
                    ),
                    const VideoActionWidgets(
                      icon: Icons.add,
                      title: 'My List',
                    ),
                    GestureDetector(
                      onTap: () {
                        final movieName =
                            VideoListItemInheritedWidget.of(context)
                                ?.movieData
                                .title;
                        if (movieName != null) {
                          Share.share(movieName);
                        }
                      },
                      child: const VideoActionWidgets(
                        icon: Icons.share,
                        title: 'Share',
                      ),
                    ),
                    const VideoActionWidgets(
                      icon: Icons.play_arrow,
                      title: 'Play',
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class VideoActionWidgets extends StatelessWidget {
  final IconData icon;
  final String title;
  const VideoActionWidgets(
      {super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Column(
        children: [
          Icon(
            icon,
            color: whiteColor,
            size: 28,
          ),
          Text(title)
        ],
      ),
    );
  }
}

class FastLaughVideoPlayer extends StatefulWidget {
  final String videoUrl;
  final void Function(bool isPlaying) onStateChanged;
  const FastLaughVideoPlayer(
      {super.key, required this.videoUrl, required this.onStateChanged});

  @override
  State<FastLaughVideoPlayer> createState() => FastLaugh_VideoPlayerState();
}

class FastLaugh_VideoPlayerState extends State<FastLaughVideoPlayer> {
  late VideoPlayerController _videoPlayerController;
  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.network(widget.videoUrl);

    _videoPlayerController.initialize().then((value) {
      setState(() {});
      _videoPlayerController.play();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: _videoPlayerController.value.isInitialized
          ? AspectRatio(
              aspectRatio: _videoPlayerController.value.aspectRatio,
              child: VideoPlayer(_videoPlayerController),
            )
          : const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            ),
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}

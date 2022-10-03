import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/application/fast_laugh/fast_laugh_bloc.dart';
import 'package:netflix_app/presentation/fast_laugh/widgets/video_list_item.dart';

class ScreenFastLaugh extends StatelessWidget {
  const ScreenFastLaugh({super.key});

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPersistentFrameCallback((_) {
    //   BlocProvider.of<FastLaughBloc>(context).add(const Initialize());
    // });
    BlocProvider.of<FastLaughBloc>(context).add(const Initialize());
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<FastLaughBloc, FastLaughState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.red,
                ),
              );
            } else if (state.isError) {
              return const Center(
                child: Text('Error while fetching data'),
              );
            } else if (state.videosList.isEmpty) {
              return const Center(
                child: Text('vedio list empty'),
              );
            } else {
              return PageView(
                scrollDirection: Axis.vertical,
                children: List.generate(
                  state.videosList.length,
                  (index) => VideoListItemInheritedWidget(
                    widget: VideoListItem(index: index),
                    key: Key(index.toString()),
                    movieData: state.videosList[index],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

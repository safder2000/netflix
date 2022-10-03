import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_app/domain/core/falilure/main_failure.dart';
import 'package:netflix_app/domain/downloads/idownloads_repo.dart';
import 'package:netflix_app/domain/downloads/models/downloads.dart';

part 'fast_laugh_event.dart';
part 'fast_laugh_state.dart';
part 'fast_laugh_bloc.freezed.dart';

final dummyVideoUrls = [
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4"
];
ValueNotifier<Set<int>> likeVideosIdsNotifier = ValueNotifier({});

@injectable
class FastLaughBloc extends Bloc<FastLaughEvent, FastLaughState> {
  FastLaughBloc(
    IDownloadRepo _downloadService,
  ) : super(FastLaughState.initial()) {
    on<Initialize>((event, emit) async {
      //sending loading to ui

      emit(
        const FastLaughState(
          videosList: [],
          isLoading: true,
          isError: false,
        ),
      );
      //get trnding movies
      final _result = await _downloadService.getDownloadsImages();
      final _state = _result.fold(
        (l) {
          return const FastLaughState(
            videosList: [],
            isLoading: false,
            isError: true,
          );
        },
        (resp) => FastLaughState(
          videosList: resp,
          isLoading: false,
          isError: false,
        ),
      );

      //send to ui
      emit(_state);
    });
    on<LikeVideo>((event, emit) async {
      likeVideosIdsNotifier.value.add(event.id);
      likeVideosIdsNotifier.notifyListeners();
    });
    on<UnlikeVideo>((event, emit) async {
      likeVideosIdsNotifier.value.remove(event.id);
      likeVideosIdsNotifier.notifyListeners();
    });
  }
}

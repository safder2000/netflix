import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_app/domain/core/falilure/main_failure.dart';
import 'package:netflix_app/domain/hot_and_new_respo/hot_n_new_service.dart';
import 'package:netflix_app/domain/hot_and_new_respo/model/hot_and_new_respo.dart';

part 'hot_and_new_event.dart';
part 'hot_and_new_state.dart';
part 'hot_and_new_bloc.freezed.dart';

@injectable
class HotAndNewBloc extends Bloc<HotAndNewEvent, HotAndNewState> {
  final HotAndNewService _hotAndNewService;

  HotAndNewBloc(this._hotAndNewService) : super(HotAndNewState.initial()) {
    //get hot and new movie data
    on<LoadedDataInComingSoon>((event, emit) async {
      // send loading to ui
      emit(HotAndNewState(
          comingSoonList: [],
          everyoneIsWatchList: [],
          isLoading: true,
          hasError: false));
      //get data from remote

      final _result = await _hotAndNewService.getHotAndNewMovieData();
      log(_result.toString());
      //data to state
      final newState = _result.fold((MainFailure failure) {
        return const HotAndNewState(
            comingSoonList: [],
            everyoneIsWatchList: [],
            isLoading: false,
            hasError: true);
      }, (HotAndNewRespo resp) {
        return HotAndNewState(
            comingSoonList: resp.results!,
            everyoneIsWatchList: state.everyoneIsWatchList,
            isLoading: false,
            hasError: false);
      });

      emit(newState);
    });
    on<LoadedDataInEveryoneIsWatching>((event, emit) async {
      // send loading to ui
      emit(HotAndNewState(
          comingSoonList: [],
          everyoneIsWatchList: [],
          isLoading: true,
          hasError: false));
      //get data from remote

      final _result = await _hotAndNewService.getHotAndNewTvData();
      log(_result.toString());
      //data to state
      final newState = _result.fold((MainFailure failure) {
        return const HotAndNewState(
            comingSoonList: [],
            everyoneIsWatchList: [],
            isLoading: false,
            hasError: true);
      }, (HotAndNewRespo resp) {
        return HotAndNewState(
            comingSoonList: resp.results!,
            everyoneIsWatchList: state.everyoneIsWatchList,
            isLoading: false,
            hasError: false);
      });

      emit(newState);
    });
  }
}

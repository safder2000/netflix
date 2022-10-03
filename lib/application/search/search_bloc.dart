import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_app/domain/core/falilure/main_failure.dart';
import 'package:netflix_app/domain/downloads/idownloads_repo.dart';
import 'package:netflix_app/domain/downloads/models/downloads.dart';
import 'package:netflix_app/domain/search/models/search_respo/search_respo.dart';
import 'package:netflix_app/domain/search/search_service.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final IDownloadRepo _downloadsService;
  final SearchService _searchService;
  SearchBloc(this._searchService, this._downloadsService)
      : super(SearchState.initial()) {
    //idle state
    on<Initialize>((event, emit) async {
      if (state.idleList.isNotEmpty) {
        emit(state);
        return;
      }
      emit(const SearchState(
        searchResultList: [],
        idleList: [],
        isLoading: true,
        isError: false,
      ));
      //get trending
      final _result = await _downloadsService.getDownloadsImages();

      final _state = _result.fold(
        (MainFailure f) {
          return const SearchState(
            searchResultList: [],
            idleList: [],
            isLoading: false,
            isError: true,
          );
        },
        (List<Downloads> list) {
          return SearchState(
            searchResultList: [],
            idleList: list,
            isLoading: false,
            isError: false,
          );
        },
      );
      emit(_state);

      //show to Ui
    });

    //search result state
    on<SearchMovie>((event, emit) async {
      log('searching for ${event.movieQuery}');
      // call search  movie api
      emit(const SearchState(
        searchResultList: [],
        idleList: [],
        isLoading: true,
        isError: false,
      ));
      final _result =
          await _searchService.searchMovies(movieQuery: event.movieQuery);
      log(_result.toString());
      final _state = _result.fold((MainFailure f) {
        return const SearchState(
          searchResultList: [],
          idleList: [],
          isLoading: false,
          isError: true,
        );
      }, (SearchRespo r) {
        return SearchState(
          searchResultList: r.results!,
          idleList: [],
          isLoading: false,
          isError: false,
        );
      });
      // show to ui
      emit(_state);
    });
  }
}

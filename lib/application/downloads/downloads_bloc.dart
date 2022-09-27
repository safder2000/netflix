import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:netflix_app/domain/downloads/idownloads_repo.dart';

import '../../domain/core/falilure/main_failure.dart';
import '../../domain/downloads/models/downloads.dart';

part 'downloads_event.dart';
part 'downloads_state.dart';
part 'downloads_bloc.freezed.dart';

class DownloadsBloc extends Bloc<DownloadsEvent, DownloadsState> {
  final IDownloadRepo _downloadsRepo;
  DownloadsBloc(this._downloadsRepo) : super(DownloadsState.initial()) {
    on<_GetDownloadsImages>((event, emit) async {
      // TODO: implement event handler
      emit(
        state.copyWith(
          isLoading: true,
          downloadsFailureOrSuccessOption: none(),
        ),
      );
      final Either<MainFailure, List<Downloads>> downlaodsOption =
          await _downloadsRepo.getDownloadsImages();
      emit(
        downlaodsOption.fold(
          (failure) => state.copyWith(
            isLoading: false,
            downloadsFailureOrSuccessOption: Some(
              Left(failure),
            ),
          ),
          (success) => state.copyWith(
            isLoading: false,
            downloadsFailureOrSuccessOption: Some(
              Right(success),
            ),
          ),
        ),
      );
    });
  }
}

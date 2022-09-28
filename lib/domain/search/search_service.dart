import 'package:dartz/dartz.dart';
import 'package:netflix_app/domain/core/falilure/main_failure.dart';
import 'package:netflix_app/domain/search/models/search_respo/search_respo.dart';

abstract class SearchService {
  Future<Either<MainFailure, SearchRespo>> searchMovies({
    required String movieQuery,
  });
}

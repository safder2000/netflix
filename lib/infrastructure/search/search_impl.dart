import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:netflix_app/domain/core/api_end_points.dart';
import 'package:netflix_app/domain/search/models/search_respo/search_respo.dart';
import 'package:netflix_app/domain/core/falilure/main_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:netflix_app/domain/search/search_service.dart';

class SearchImpl implements SearchService {
  @override
  Future<Either<MainFailure, SearchRespo>> searchMovies(
      {required String movieQuery}) async {
    try {
      final Response response = await Dio(BaseOptions()).get(
        ApiEndPoints.search,
        queryParameters: {
          'query': movieQuery,
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final Response response =
            await Dio(BaseOptions()).get(ApiEndPoints.search);
        final result = SearchRespo.fromJson(response.data);

        return Right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }
}

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_app/domain/core/api_end_points.dart';
import 'package:netflix_app/domain/core/falilure/main_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:netflix_app/domain/hot_and_new_respo/hot_n_new_service.dart';
import 'package:netflix_app/domain/hot_and_new_respo/model/hot_and_new_respo.dart';
import 'package:netflix_app/domain/search/models/search_respo/search_respo.dart';

@LazySingleton(as: HotAndNewService)
class HotAndNewImplimentation implements HotAndNewService {
  @override
  Future<Either<MainFailure, HotAndNewRespo>> getHotAndNewMovieData() async {
    try {
      final response = await Dio(BaseOptions()).get(
        ApiEndPoints.hotAndNewMovie,
      );
      // log(response.data.toString());

      if (response.statusCode == 200 || response.statusCode == 201) {
        // final response = await Dio(BaseOptions()).get(ApiEndPoints.search);
        final result = HotAndNewRespo.fromJson(response.data);

        return Right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }

  @override
  Future<Either<MainFailure, HotAndNewRespo>> getHotAndNewTvData() async {
    try {
      final response = await Dio(BaseOptions()).get(
        ApiEndPoints.search,
      );
      // log(response.data.toString());

      if (response.statusCode == 200 || response.statusCode == 201) {
        // final response = await Dio(BaseOptions()).get(ApiEndPoints.search);
        final result = HotAndNewRespo.fromJson(response.data);

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

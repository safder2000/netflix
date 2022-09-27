import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:netflix_app/domain/core/api_end_points.dart';
import 'package:netflix_app/domain/core/falilure/main_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:netflix_app/domain/downloads/idownloads_repo.dart';
import 'package:netflix_app/domain/downloads/models/downloads.dart';

class DownloadsRepository implements IDownloadRepo {
  @override
  Future<Either<MainFailure, List<Downloads>>> getDownloadsImages() async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoints.downloads);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final List<Downloads> downloadsList = [];
        for (final raw in response.data) {
          downloadsList.add(Downloads.fromJson(raw as Map<String, dynamic>));
        }
        print(downloadsList);
        return Right(downloadsList);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (_) {
      return const Left(MainFailure.clientFailure());
    }
  }
}

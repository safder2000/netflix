import 'package:dartz/dartz.dart';
import 'package:netflix_app/domain/core/falilure/main_failure.dart';
import 'package:netflix_app/domain/hot_and_new_respo/model/hot_and_new_respo.dart';

abstract class HotAndNewService {
  Future<Either<MainFailure, HotAndNewRespo>> getHotAndNewMovieData();
  Future<Either<MainFailure, HotAndNewRespo>> getHotAndNewTvData();
}

import 'package:dartz/dartz.dart';
import 'package:netflix_app/domain/core/falilure/main_failure.dart';
import 'package:netflix_app/domain/downloads/models/downloads.dart';

abstract class IDownloadRepo {
  Future<Either<MainFailure, List<Downloads>>> getDownloadsImages();
}

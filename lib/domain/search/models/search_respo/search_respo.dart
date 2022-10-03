import 'package:json_annotation/json_annotation.dart';
import 'package:netflix_app/core/constants.dart';

part 'search_respo.g.dart';

@JsonSerializable()
class SearchRespo {
  @JsonKey(name: 'results')
  List<SearchResultData>? results;

  SearchRespo({
    this.results = const [],
  });

  factory SearchRespo.fromJson(Map<String, dynamic> json) {
    return _$SearchRespoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchRespoToJson(this);
}

@JsonSerializable()
class SearchResultData {
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;
  int? id;
  @JsonKey(name: 'original_title')
  String? originalTitle;
  String? overview;
  @JsonKey(name: 'poster_path')
  String? posterPath;

  // String get bannerImageUrl => '$imageAppendUrl$backdropPath';
  String get posterImageUrl => '$imageAppendUrl$posterPath';
  @JsonKey(name: 'release_date')
  String? releaseDate;

  SearchResultData({
    this.backdropPath,
    this.id,
    this.originalTitle,
    this.overview,
    this.posterPath,
    this.releaseDate,
  });

  factory SearchResultData.fromJson(Map<String, dynamic> json) {
    return _$SearchResultDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchResultDataToJson(this);
}

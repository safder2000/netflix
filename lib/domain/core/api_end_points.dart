import 'package:netflix_app/core/strings.dart';
import 'package:netflix_app/infrastructure/api_key.dart';

class ApiEndPoints {
  static const downloads = "$kBaseUrl/trending/movie/day?api_key=$apiKey";
}

class ApiConstants {
  static String apiKey = '3d71e92264ca58376692e42479e39d2f';
  static String baseUrl = 'https://api.themoviedb.org/3/movie/';
  static String getMoviesUrl = '${baseUrl}upcoming?api_key=$apiKey';
  static String moviesSearchUrl =
      'https://api.themoviedb.org/3/search/movie?query=';
}

class AppConstants {
  static String imageUrl = 'https://image.tmdb.org/t/p/original/';
}

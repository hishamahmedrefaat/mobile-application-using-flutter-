import 'package:day_7/model/movie.dart';
import 'package:day_7/model/product.dart';
import 'package:day_7/model/tv_show.dart'; // Add this import
import 'package:dio/dio.dart';

import '../screens/TVshow.dart';

class ApiService {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://api.themoviedb.org/3'));

  Future<List<Movie>> getMovies(int pageNumber) async {
    try {
      final response = await _dio.get(
          '/movie/now_playing?api_key=ca6f14e9b304d02e85529141e9cfd6f3&page=$pageNumber');
      if (response.statusCode == 200) {
        return (response.data['results'] as List)
            .map((movieJson) => Movie.fromJson(movieJson))
            .toList();
      } else {
        throw Exception('Error casting data');
      }
    } catch (e) {
      throw Exception('Error getting Data');
    }
  }

  Future<List<TvShow>> getTvShows(int pageNumber) async {
    try {
      final response = await _dio.get(
          '/tv/popular?api_key=ca6f14e9b304d02e85529141e9cfd6f3&page=$pageNumber');
      if (response.statusCode == 200) {
        return (response.data['results'] as List)
            .map((tvShowJson) => TvShow.fromJson(tvShowJson))
            .toList();
      } else {
        throw Exception('Error casting data');
      }
    } catch (e) {
      throw Exception('Error getting Data');
    }
  }

  Future<List<Product>> getProducts() async {
    try {
      final response = await _dio.get('/products');
      if (response.statusCode == 200) {
        return (response.data as List)
            .map((productJson) => Product.fromJson(productJson))
            .toList();
      } else {
        throw Exception('Error casting data');
      }
    } catch (e) {
      throw Exception('Error getting Data');
    }
  }

  Future<Product> getProductById(int id) async {
    try {
      final response = await _dio.get('/products/$id');
      if (response.statusCode == 200) {
        return Product.fromJson(response.data);
      } else {
        throw Exception('Error casting data');
      }
    } catch (err) {
      throw Exception('Error getting Data:$err');
    }
  }
}

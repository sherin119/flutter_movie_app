import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter_movie_app/json_data.dart';
import 'package:flutter_movie_app/config.dart';

class ApiProvider {
  Future<List> getNowPlaying() async {
    var url =
        'https://api.themoviedb.org/3/movie/now_playing?page={0}&api_key=${apiKey}';
    var response = await http.get(Uri.parse(url));
    return movieFromJson(response.body).results;
  }

  Future<List> getUpcoming() async {
    var url =
        'https://api.themoviedb.org/3/movie/upcoming?api_key=${apiKey}&language=en-US&page=1';
    var response = await http.get(Uri.parse(url));
    return movieFromJson(response.body).results;
  }
}

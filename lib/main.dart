import 'package:flutter/material.dart';
import 'package:flutter_movie_app/now_playing.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: Colors.black,
        //dialogBackgroundColor: Colors.black,
        colorScheme: ColorScheme.dark(primary: Color(0xff7D090B)),
        buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
        highlightColor: Colors.grey[400],
      ),
      home: Scaffold(
        body: NowPlayingMovies(),
      ),
    );
  }
}

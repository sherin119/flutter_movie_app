import 'package:flutter/material.dart';
import 'package:flutter_movie_app/api_provider.dart';
import 'package:flutter_movie_app/detail.dart';
import 'package:flutter_movie_app/json_data.dart';
import 'package:flutter_movie_app/upcoming_movies.dart';

class NowPlayingMovies extends StatefulWidget {
  @override
  NowPlayingMoviesState createState() {
    return NowPlayingMoviesState();
  }
}

class NowPlayingMoviesState extends State<NowPlayingMovies> {
  @override
  void initState() {
    super.initState();

    setState(() {
      ApiProvider().getNowPlaying();
    });
  }

  @override
  Widget build(BuildContext context) {
    var imageUrl = 'https://image.tmdb.org/t/p/w500/';

    return Scaffold(
      drawer: Theme(data: Theme.of(context).copyWith(canvasColor: Colors.black.withOpacity(0.5)),
        child: Drawer(
          child: ListView(
            children: [
              SizedBox(
                height: 50,
              ),
              ListTile(
                title: Text('Now Playing movies', style: TextStyle(fontSize: 20)),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => NowPlayingMovies()),
                ),
              ),
              ListTile(
                title: Text('Upcoming movies', style: TextStyle(fontSize: 20)),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => UpcomingMovies()),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.black,
      appBar: AppBar(
        //centerTitle: true,
        backgroundColor: Colors.black,
        actions: <Widget>[],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: FutureBuilder(
            future: ApiProvider().getNowPlaying(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (snapshot.hasData) {
                List nowPlaying = snapshot.data;
                print(snapshot.data);

                return Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    children: [
                      Text('NOW PLAYING',
                    style: TextStyle(
                        color: Colors.grey,
                        letterSpacing: 3,
                        fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                      SizedBox(height: 20),
                      GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: nowPlaying.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: .78,
                            crossAxisSpacing: 1,
                            mainAxisSpacing: 1,
                            crossAxisCount: 2),
                        itemBuilder: (BuildContext context, int index) {
                          Result result = nowPlaying[index];
                          return GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => Details(result: result)),
                            ),
                            child: Card(
                              color: Colors.grey[850],
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      child: Image(
                                        height: 400,
                                        width: 120,
                                        image: NetworkImage(imageUrl +
                                            '${nowPlaying[index].posterPath}'),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }
}

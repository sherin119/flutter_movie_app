import 'package:flutter/material.dart';
import 'package:flutter_movie_app/api_provider.dart';
import 'package:flutter_movie_app/json_data.dart';

class Details extends StatefulWidget {
  final Result result;
  Details({this.result});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  var imageUrl = 'https://image.tmdb.org/t/p/w500/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(

        centerTitle: true,
        //title: Text('NOW PLAYING', style: TextStyle(color: Colors.red),),
        backgroundColor: Colors.black,
        actions: <Widget>[],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: FutureBuilder(
            future: ApiProvider().getUpcoming(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (snapshot.hasData) {
                // List nowPlaying = snapshot.data;
                // print(snapshot.data);

                return Container(
                  margin: EdgeInsets.only(left: 16, right: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Text(
                      //   '${widget.result.title}',
                      //   style: TextStyle(
                      //       color: Colors.grey,
                      //       fontWeight: FontWeight.bold,
                      //       fontSize: 30),
                      // ),
                      //SizedBox(height: 10),

                      Container(
                        margin: EdgeInsets.only(left: 16, right: 16),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          //borderRadius: BorderRadius.circular(18),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blueGrey,
                              offset: Offset(0.0, 4.0),
                              blurRadius: 6.0,
                            ),
                          ],
                        ),
                        child: Hero(
                          tag: imageUrl + '${widget.result.posterPath}',
                          child: Image(
                            height: 350,
                            width: 200,
                            image: NetworkImage(
                                imageUrl + '${widget.result.posterPath}'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${widget.result.title}',
                            style: TextStyle(
                                color: Colors.blue[300],
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                              SizedBox(width: 10),
                              Text(
                                '${widget.result.voteAverage} / 10',
                                style: TextStyle(
                                    color: Colors.blue[300],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Text(
                            '${widget.result.voteCount} votes',
                            style: TextStyle(
                                color: Colors.blue[300],
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Release Date: " +
                            "${widget.result.releaseDate.toLocal()}"
                                .split(' ')[0],
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),

                      SizedBox(height: 30),
                      Text(
                        'Synopsis',
                        style: TextStyle(
                            color: Colors.blue[300],
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            letterSpacing: 1.5,
                            height: 1.5),
                      ),
                      Text(
                        '${widget.result.overview}',
                        style: TextStyle(
                            color: Colors.grey,
                            //fontWeight: FontWeight.bold,
                            fontSize: 15,
                            letterSpacing: 1.5,
                            height: 1.5),
                      ),
                      SizedBox(height: 20),
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

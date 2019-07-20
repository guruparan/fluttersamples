import 'package:flutter/material.dart';
import 'package:moviesapp/services/MovieService.dart';
import 'package:moviesapp/models/MovieInfo.dart';
import 'package:moviesapp/components/PaddedText.dart';

class MovieDetail extends StatelessWidget {
  final String movieName;
  final String imdbId;

  MovieDetail({this.movieName, this.imdbId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.movieName),
      ),
      body: FutureBuilder<MovieInfo>(
          future: getMovie(this.imdbId),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                          alignment: Alignment.center,
                          child: Image.network(
                            snapshot.data.poster,
                            width: 200,
                          ),
                        ),
                        Text(snapshot.data.plot, textAlign: TextAlign.justify),
                        PaddedText("Year : " + snapshot.data.year),
                        PaddedText("Genre : " + snapshot.data.genre),
                        PaddedText("Directed by : " + snapshot.data.director),
                        PaddedText("Runtime : " + snapshot.data.runtime),
                        PaddedText("Rated : " + snapshot.data.rating),
                        PaddedText("IMDB Rating : " + snapshot.data.imdbRating),
                        PaddedText("Meta Score : " + snapshot.data.metaScore),
                      ]));
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}

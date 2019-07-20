import 'package:flutter/material.dart';
import 'package:moviesapp/screens/MovieDetail.dart';
import 'package:moviesapp/components/MovieItem.dart';
import 'package:moviesapp/models/Movie.dart';

class MovieList extends StatelessWidget {
  final List<Movie> movies;

  MovieList({this.movies});

  @override
  Widget build(context) {
    return new Container(
        decoration: BoxDecoration(color: Colors.grey),
        child: ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: this.movies.length,
            itemBuilder: (BuildContext context, int index) {
              return new GestureDetector(
                  child: MovieItem(movie: this.movies[index]),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MovieDetail(
                                movieName: movies[index].title,
                                imdbId: movies[index].imdbID,
                              )),
                    );
                  });
            }));
  }
}

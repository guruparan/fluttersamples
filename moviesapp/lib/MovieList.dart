import 'package:flutter/material.dart';
import 'package:moviesapp/MovieItem.dart';
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
                  final snackBar =
                      SnackBar(content: Text(this.movies[index].imdbID));
                  Scaffold.of(context).showSnackBar(snackBar);
                },
              );
            }));
  }
}

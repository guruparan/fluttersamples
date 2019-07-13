import 'package:flutter/material.dart';
import 'package:moviesapp/MovieList.dart';
import 'package:moviesapp/MovieService.dart';
import 'package:moviesapp/models/Movie.dart';
import 'package:flutter/services.dart';

class MoviesAppHome extends StatefulWidget {
  @override
  MoviesAppHomeState createState() => MoviesAppHomeState();
}

class MoviesAppHomeState extends State<MoviesAppHome> {
  final searchTextController = new TextEditingController();
  String searchText = "";

  @override
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: Row(children: <Widget>[
            Flexible(
              child: TextField(
                controller: searchTextController,
                decoration: InputDecoration(hintText: 'Enter a search term'),
              ),
            ),
            IconButton(
              icon: Icon(Icons.search),
              tooltip: 'Search Movies',
              onPressed: () {
                setState(() {
                  searchText = searchTextController.text;
                  SystemChannels.textInput.invokeMethod('TextInput.hide');
                });
              },
            ),
          ]),
          padding: EdgeInsets.all(10),
        ),
        if (searchText.length > 0)
          FutureBuilder<List<Movie>>(
              future: searchMovies(searchText),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Expanded(child: MovieList(movies: snapshot.data));
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return CircularProgressIndicator();
              }),
      ],
    );
  }
}
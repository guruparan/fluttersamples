import 'package:flutter/material.dart';
import 'package:moviesapp/MoviesAppHome.dart';

void main() => runApp(MoviesApp());

class MoviesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies Sample',
      home: Scaffold(
          appBar: AppBar(
            title: Center(child: Text('Search Movies')),
          ),
          body: MoviesAppHome()),
    );
  }
}
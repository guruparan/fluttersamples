import 'package:flutter/material.dart';

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
        body: Column(
          children: <Widget>[
            Container(
              child: Row(children: <Widget>[
                Flexible(
                  child: TextField(
                    decoration:
                        InputDecoration(hintText: 'Enter a search term'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.search),
                  tooltip: 'Search Movies',
                  onPressed: () {},
                ),
              ]),
              padding: EdgeInsets.all(10),
            ),
            Container(color: Colors.green,child: Text("Movie items will be rendered here"),)
          ],
        ),
      ),
    );
  }
}

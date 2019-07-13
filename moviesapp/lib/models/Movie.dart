class Movie {
  final String title;
  final String year;
  final String type;
  final String poster;
  final String imdbID;

  Movie({this.title, this.year, this.type, this.poster, this.imdbID});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        title: json['Title'],
        year: json['Year'],
        type: json['Type'],
        poster: json['Poster'],
        imdbID: json['imdbID']);
  }
}

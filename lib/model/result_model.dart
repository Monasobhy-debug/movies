class Result {
  final String filmName;
  final String filmDate;
  final voteAverage;
  final String posterPath;
  final String overView;
  Result(
      {this.filmName,
      this.filmDate,
      this.posterPath,
      this.voteAverage,
      this.overView});

  factory Result.fromJson(Map<String, dynamic> jsonData) {
    return Result(
      filmName: jsonData['title'],
      filmDate: jsonData['release_date'],
      voteAverage: jsonData['vote_average'],
      posterPath: jsonData['poster_path'],
      overView: jsonData['overview'],
    );
  }
}

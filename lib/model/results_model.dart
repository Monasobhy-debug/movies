class Results {
  Results({this.results});
  final List<dynamic> results;
  factory Results.fromJson(Map<String, dynamic> jsonData) {
    return Results(results: jsonData['results']);
  }
}

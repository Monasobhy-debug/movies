import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies/model/results_model.dart';
import 'package:movies/model/result_model.dart';

// const apiKey = '49066942591aa4286806177d1fc935a0';
const apiKey = 'e42404e936e5b17d9cb1eca07ea20fdd';

class NetworkHelper {
  NetworkHelper(this.url);

  final Uri url;
  var data;
  Future<List<Result>> fetchResults() async {
    http.Response response = await http.get(url);
    try {
      if (response.statusCode == 200) {
        String data = response.body;
        var jsonData = jsonDecode(data);
        // print(jsonDecode(data));
        Results results = Results.fromJson(jsonData);
        // Iterable results = jsonData['results'];
        List<Result> resultsList =
            results.results.map((e) => Result.fromJson(e)).toList();
        return resultsList;
      } else {
        print('Status code ${response.statusCode}');
        return data;
      }
    } catch (e) {
      print(e);
    }
  }
}

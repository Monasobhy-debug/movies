import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/componant/movieItem.dart';
import 'package:movies/componant/api.dart';
import 'package:movies/model/result_model.dart';

// const apiKey = '49066942591aa4286806177d1fc935a0';
const apiKey = 'e42404e936e5b17d9cb1eca07ea20fdd';

class MovieBox extends StatefulWidget {
  @override
  _MovieBoxState createState() => _MovieBoxState();
}

class _MovieBoxState extends State<MovieBox> {
  List<Result> results = [];
  void getData() async {
    NetworkHelper networkHelper = NetworkHelper(Uri.parse(
        'https://api.themoviedb.org/3/movie/popular?api_key=$apiKey&page=$pageNum'));

    results = await networkHelper.fetchResults();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    // print(results[1].filmDate);
  }

  int pageNum = 1;
  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                icon: Icon(
                  Icons.navigate_before,
                  size: 35,
                ),
                onPressed: () {
                  setState(() {
                    if (pageNum != 1) {
                      pageNum--;
                      print(pageNum);
                    }
                  });
                }),
            Text(
              'Movie Box',
              textAlign: TextAlign.center,
            ),
            IconButton(
                icon: Icon(
                  Icons.navigate_next,
                  size: 35,
                ),
                onPressed: () {
                  setState(() {
                    if (pageNum != 500) {
                      pageNum++;
                      print(pageNum);
                    }
                  });
                }),
          ],
        ),
      ),
      body: (results?.isNotEmpty ?? true)
          ? SafeArea(
              child: ListView.builder(
                  itemCount: results.length,
                  itemBuilder: (context, index) {
                    final movie = results[index];
                    print(index);
                    return SafeArea(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            MovieItem(
                              filmName: movie.filmName ?? "name",
                              posterPath: movie.posterPath ?? "image",
                              voteAverage: movie.voteAverage ?? "12.2",
                              filmDate: movie.filmDate ?? "12-3",
                              overView: movie.overView ?? " ",
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}

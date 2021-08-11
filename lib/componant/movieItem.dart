import 'package:flutter/material.dart';
import 'package:movies/screens/secondPage.dart';

class MovieItem extends StatelessWidget {
  MovieItem(
      {this.voteAverage,
      this.filmDate,
      this.filmName,
      this.posterPath,
      this.overView});
  final String filmName;
  final String filmDate;
  final voteAverage;
  final String posterPath;
  final String overView;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      elevation: 20.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      color: Color(0xFF1d1c3b),
      child: Container(
        height: 120,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondPage(
                      filmDate: filmDate,
                      voteAverage: voteAverage,
                      posterPath: posterPath,
                      filmName: filmName,
                      overView: overView,
                    ),
                  ),
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: SizedBox(
                  width: 100,
                  child: Image.network(
                    // (posterPath != null)
                    'https://image.tmdb.org/t/p/w500/$posterPath',
                    // : 'https://image.tmdb.org/t/p/w500//yAcb58vipewa1BfNit2RjE6boXA.jpg',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Container(
              width: 190,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Text(
                      // (filmName != null) ?
                      filmName,
                      // : 'Godzilla vs. king',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  Text(
                    // (filmDate != null) ?
                    filmDate,
                    // : '2021-03-24',
                    style: TextStyle(fontSize: 10, color: Colors.grey),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.cyan,
                        size: 10,
                      ),
                      Text(
                        // (voteAverage != null) ?
                        ' ' + voteAverage.toString(),
                        // : ' 8.3',
                        style: TextStyle(fontSize: 15, color: Colors.yellow),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

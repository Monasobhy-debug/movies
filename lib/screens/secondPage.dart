import 'package:flutter/material.dart';
import '../componant/movieItem.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SecondPage extends StatelessWidget {
  SecondPage(
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
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: FittedBox(
            fit: BoxFit.fitHeight,
            child: Container(
              height: 900,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.network(
                      'https://image.tmdb.org/t/p/w500/$posterPath',
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MovieItem(),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        size: 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 380,
                    left: 0,
                    child: Container(
                      padding: EdgeInsets.only(right: 15.0, left: 15.0),
                      decoration: BoxDecoration(
                          color: Color(0xFF1d1c3b),
                          borderRadius: BorderRadius.circular(20.0)),
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 17.0),
                              child: Column(
                                // mainAxisAlignment:
                                //     MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    filmName,
                                    // 'Godzilla vs. king',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    filmDate,
                                    // '2021-03-24',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.grey),
                                  ),
                                  ListTile(
                                    title: Row(children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.cyan,
                                        size: 12,
                                      ),
                                      Text(
                                        ' ' + voteAverage.toString(),
                                        // ' 8.3',
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.yellow),
                                      ),
                                      // SizedBox(
                                      //   width: 190.0,
                                      // ),
                                    ]),
                                    trailing: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.green),
                                        onPressed: () {
                                          Fluttertoast.showToast(
                                            msg: 'Successfully saved',
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                          );
                                        },
                                        child: Text('Download')),
                                  ),
                                  Text(
                                    'Overview',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Flexible(
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      height: 300,
                                      child: Text(
                                        overView,
                                        // 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry'
                                        // 's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.white54,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  // SizedBox(
                                  //   height: 150,
                                  // )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

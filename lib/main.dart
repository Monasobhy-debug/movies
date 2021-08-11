import 'package:flutter/material.dart';
import 'screens/movieBox.dart';
import 'package:movies/screens/movieBox.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xFF17162e),
          scaffoldBackgroundColor: Color(0xff17162e)),
      home: MovieBox(),
    );
  }
}

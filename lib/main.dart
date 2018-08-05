import 'package:chess_vectors_experiment/chess_vectors.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Chess vectors experiment'),
          backgroundColor: Colors.blue,
        ),
        body: Row(
          children: <Widget>[
            WhitePawn(position: Offset.zero, size: 50.0),
            BlackPawn(position: Offset(0.0, 50.0), size: 50.0),
            WhiteKnight(position: Offset(50.0, 0.0), size: 50.0),
            BlackKnight(position: Offset(50.0, 50.0), size: 50.0),
            WhiteBishop(position: Offset(100.0, 0.0), size: 50.0),
            BlackBishop(position: Offset(100.0, 50.0), size: 50.0),
            WhiteRook(position: Offset(150.0, 0.0), size: 50.0),
            BlackRoot(position: Offset(150.0, 50.0), size: 50.0),
            WhiteQueen(position: Offset(200.0, 0.0), size: 50.0)
          ],
        ));
  }
}

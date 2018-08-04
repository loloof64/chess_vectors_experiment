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
      body: new Container(
        decoration: BoxDecoration(color: Colors.red),
        child: new Center(
          child: new MyChessVector(size: 45.0),
        ),
      ),
    );
  }
}

@immutable
class MyChessVector extends StatelessWidget {
  final double size;

  MyChessVector({this.size});

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: size,
      height: size,
      child: WhiteKnight(),
    );
  }
}

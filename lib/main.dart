import 'package:flutter/material.dart';
import 'vector_image.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
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
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text('Chess vectors experiment'),
        backgroundColor: Colors.blue,
      ),
      body: new Container(
        decoration: BoxDecoration(color: Colors.red),
        child: new Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
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
      child: new CustomPaint(
        painter: new VectorImagePainter(<VectorImagePathDefinition>[
          VectorImagePathDefinition(path:"M 22,10 C 32.5,11 38.5,18 38,39"
              " L 15,39 C 15,30 25,32.5 23,18"),
          VectorImagePathDefinition(path:"M 24,18 C 24.38,20.91 18.45,25.37"
              " 16,27 C 13,29 13.18,31.34 11,31 C "
          "9.958,30.06 12.41,27.96 11,28 C 10,28 11.19,29.23 10,30 C 9,30"
              " 5.997,31 6,26 C 6,24 12,14 12,14 C 12,14 13.89,12.1 14,10.5 C"
              " 13.27,9.506 13.5,8.5 13.5,7.5 C 14.5,6.5 16.5,10 16.5,10 L"
              " 18.5,10 C 18.5,10 19.28,8.008 21,7 C 22,7 22,10 22,10"),
          VectorImagePathDefinition(path: "M 9.5 25.5 A 0.5 0.5 0 1 1"
              " 8.5,25.5 A 0.5 0.5 0 1 1 9.5 25.5 z", fill: Colors.black),
          VectorImagePathDefinition(path: "M 15 15.5 A 0.5 1.5 0 1 1"
              "  14,15.5 A 0.5 1.5 0 1 1  15 15.5 z", fill: Colors.black)
        ]),
      ),
    );
  }
}
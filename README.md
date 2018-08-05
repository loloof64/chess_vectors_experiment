# Chess vectors experiment

An attempt to render chess vectors into Flutter.

# Usage

The different vectors (WhitePawn, BlackPawn, WhiteKnight, ...) can be directly integrated as
components into your own Widgets.

A simple example :

```
import 'package:chess_vectors_experiment/chess_vectors.dart';
import 'package:flutter/material.dart';

...

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const commonSize = 50.0;
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Chess vectors experiment'),
          backgroundColor: Colors.blue,
        ),
        body: Container(
            decoration: BoxDecoration(
              color: Colors.red,
            ),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    WhitePawn(size: commonSize),
                    WhiteKnight(size: commonSize),
                    WhiteBishop(size: commonSize),
                    WhiteRook(size: commonSize),
                    WhiteQueen(size: commonSize),
                    WhiteKing(size: commonSize)
                  ],
                ),
                Row(
                  children: <Widget>[
                    BlackPawn(size: commonSize),
                    BlackKnight(size: commonSize),
                    BlackBishop(size: commonSize),
                    BlackRook(size: commonSize),
                    BlackQueen(size: commonSize),
                    BlackKing(size: commonSize)
                  ],
                ),
                Row(
                  children: <Widget>[
                    WhiteRook(position: Offset(20.0, 5.0), size: 60.0)
                  ],
                )
              ],
            )));
  }
}
```


## Current status

[X] The vectors can be moved and resized

[X] White Pawn

[X] Black Pawn

[X] White Knight

[X] Black Knight

[X] White Bishop

[X] Black Bishop

[X] White Rook

[X] Black Rook

[X] White Queen

[X] Black Queen

[X] White King

[X] Black King

## CREDITS

Adapted chess vectors from a page of Wikimedia Commons
 (https://commons.wikimedia.org/wiki/Category:SVG_chess_pieces).

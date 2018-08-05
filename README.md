# Chess vectors experiment

An attempt to render chess vectors into Flutter.

# Usage

The different vectors (WhitePawn, BlackPawn, WhiteKnight, ...) can be directly integrated as
components into your own Widgets.

A simple example :

```
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
            WhiteKnight(position: Offset.zero, size: 50.0),
            BlackKnight(position: Offset(50.0, 0.0), size: 50.0),
            BlackBishop(position: Offset(100.0, 0.0), size: 50.0)
          ],
        ));
  }
}
```


## Current status

[X] The vectors can be moved and resized
[ ] White Pawn
[ ] Black Pawn
[X] White Knight
[X] Black Knight
[X] White Bishop
[X] Black Bishop
[ ] White Rook
[ ] Black Rook
[ ] White Queen
[ ] Black Queen
[ ] White King
[ ] Black King

## CREDITS

Adapted chess vectors from a page of Wikimedia Commons
 (https://commons.wikimedia.org/wiki/Category:SVG_chess_pieces).

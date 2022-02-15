import 'package:flutter/material.dart';

enum TileState { covered, blown, open, flagged, revealed }

void main() {
  runApp(MineSweeper());
}

class MineSweeper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Minesweeper',
      home: Board(),
    );
  }
}

class Board extends StatefulWidget {
  Board({Key? key}) : super(key: key);
  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: Text("Board 1"));
  }
}

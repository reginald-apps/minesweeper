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
  final int rows = 9;
  final int cols = 9;
  final int numOfMines = 11;

  late List<List<TileState>> uiState;

  void resetBoard() {
    uiState = new List<List<TileState>>.generate(rows, (row) {
      return new List<TileState>.filled(cols, TileState.covered);
    });
  }

  @override
  void initState() {
    resetBoard();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return buildBoard();
  }

  Widget buildBoard() {
    List<Row> boardRow = <Row>[];
    for (int i = 0; i < rows; i++) {
      List<Widget> rowChildren = <Widget>[];
      for (int j = 0; j < cols; j++) {
        TileState state = uiState[i][j];
        if (state == TileState.covered) {
          rowChildren.add(GestureDetector(
            child: Listener(
                child: Container(
              margin: EdgeInsets.all(2.0),
              height: 20.0,
              width: 20.0,
              color: Colors.green,
            )),
          ));
        }
      }
      boardRow.add(Row(
        children: rowChildren,
        mainAxisAlignment: MainAxisAlignment.center,
        key: ValueKey<int>(i),
      ));
    }
    return Container(
      color: Colors.grey[700],
      padding: EdgeInsets.all(10.0),
      child: Column(children: boardRow),
    );
  }
}

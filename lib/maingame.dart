import 'package:flutter/material.dart';
import 'package:missfortune/minoblock.dart';

class MainGame extends StatelessWidget {
  var _gameSize;
  // var _game;
  var _idx = 0;
  var _initColor = [
    Colors.black26,
    Colors.black12,
  ];
  MainGame(gameSize, {initColors}) {
    _gameSize = gameSize;
    _initColor = initColors;
    // initGame();
  }

  @override
  Widget build(BuildContext context) {
    // return Container(
    //         width: _gameSize * 3,
    //         height: _gameSize * 3,
    //         child: Column(
    //           children: <Widget>[
    //             Row(
    //               children: <Widget>[
    //                 Container(
    //                   width: _gameSize,
    //                   height: _gameSize,
    //                   color: _initColor[_idx++ % 2],
    //                 ),
    //                 Container(
    //                   width: _gameSize,
    //                   height: _gameSize,
    //                   color: _initColor[_idx++ % 2],
    //                 ),
    //                 Container(
    //                   width: _gameSize,
    //                   height: _gameSize,
    //                   color: _initColor[_idx++ % 2],
    //                 ),
    //               ],
    //             ),
    //             Row(
    //               children: <Widget>[
    //                 Container(
    //                   width: _gameSize,
    //                   height: _gameSize,
    //                   color: _initColor[_idx++ % 2],
    //                 ),
    //                 Container(
    //                   width: _gameSize,
    //                   height: _gameSize,
    //                   color: _initColor[_idx++ % 2],
    //                 ),
    //                 Container(
    //                   width: _gameSize,
    //                   height: _gameSize,
    //                   color: _initColor[_idx++ % 2],
    //                 ),
    //               ],
    //             ),
    //             Row(
    //               children: <Widget>[
    //                 Container(
    //                   width: _gameSize,
    //                   height: _gameSize,
    //                   color: _initColor[_idx++ % 2],
    //                 ),
    //                 Container(
    //                   width: _gameSize,
    //                   height: _gameSize,
    //                   color: _initColor[_idx++ % 2],
    //                 ),
    //                 Container(
    //                   width: _gameSize,
    //                   height: _gameSize,
    //                   color: _initColor[_idx++ % 2],
    //                 ),
    //               ],
    //             ),
    //           ],
    //         ));
    return DragTarget(
      onAccept: (MinoBlock data) {
        _initColor[1] = Colors.red;
        print(data.getPoint.toString());
      },
      onWillAccept: (data)=>true,
      builder: (context, List<MinoBlock> cd, rd) {
        return Container(
            width: _gameSize * 3,
            height: _gameSize * 3,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      width: _gameSize,
                      height: _gameSize,
                      color: _initColor[_idx++ % 2],
                    ),
                    Container(
                      width: _gameSize,
                      height: _gameSize,
                      color: _initColor[_idx++ % 2],
                    ),
                    Container(
                      width: _gameSize,
                      height: _gameSize,
                      color: _initColor[_idx++ % 2],
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Container(
                      width: _gameSize,
                      height: _gameSize,
                      color: _initColor[_idx++ % 2],
                    ),
                    Container(
                      width: _gameSize,
                      height: _gameSize,
                      color: _initColor[_idx++ % 2],
                    ),
                    Container(
                      width: _gameSize,
                      height: _gameSize,
                      color: _initColor[_idx++ % 2],
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Container(
                      width: _gameSize,
                      height: _gameSize,
                      color: _initColor[_idx++ % 2],
                    ),
                    Container(
                      width: _gameSize,
                      height: _gameSize,
                      color: _initColor[_idx++ % 2],
                    ),
                    Container(
                      width: _gameSize,
                      height: _gameSize,
                      color: _initColor[_idx++ % 2],
                    ),
                  ],
                ),
              ],
            ));
      },
    );
  }

}
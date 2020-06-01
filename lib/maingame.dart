import 'package:flutter/material.dart';
import 'package:missfortune/minoblock.dart';

class MainGame{
  var _gameSize;
  // var _game;
  var _idx = 0;
  var initColor = [
    Colors.black26,
    Colors.black12,
    Colors.black26,
    Colors.black12,
    Colors.black26,
    Colors.black12,
    Colors.black26,
    Colors.black12,
    Colors.black26,
  ];
  var mainPoint = [
    0,0,0,
    0,0,0,
    0,0,0    
  ];
  MainGame(gameSize, {List<Color> initColors}) {
    _gameSize = gameSize;
    initColor = initColors == null ? initColor : initColors;
    // initGame();
  }
  Widget createContainer() {
    _idx = _idx > 8 ? 0 : _idx;
  return Container(
        width: _gameSize,
        height: _gameSize,
        color: initColor[_idx++],
      );
  }
  Widget getBuild(){
    // return DragTarget(
    //   onAccept: (MinoBlock data) {
    //       _initColor[1] = Colors.red;
    //       print(data.getPoint.toString() + ' ' + _initColor.toList().toString());
    //   },
    //   onWillAccept: (MinoBlock data) {
        
    //     _initColor[0] = Colors.blue;
    //     return true;
    //   },
    //   builder: (context, List<MinoBlock> cd, rd) {
        return Container(
            width: _gameSize * 3,
            height: _gameSize * 3,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    createContainer(),
                    createContainer(),
                    createContainer(),
                  ],
                ),
                Row(
                  children: <Widget>[
                    createContainer(),
                    createContainer(),
                    createContainer(),
                  ],
                ),
                Row(
                  children: <Widget>[
                    createContainer(),
                    createContainer(),
                    createContainer(),
                  ],
                ),
              ],
            ));
      // },
    // );
  }
  // @override
  // Widget build(BuildContext context) {
  //   return DragTarget(
  //     onAccept: (MinoBlock data) {
  //         _initColor[1] = Colors.red;
  //         print(data.getPoint.toString() + ' ' + _initColor.toList().toString());
  //     },
  //     onWillAccept: (MinoBlock data) {
        
  //       _initColor[0] = Colors.blue;
  //       return true;
  //     },
  //     builder: (context, List<MinoBlock> cd, rd) {
  //       return Container(
  //           width: _gameSize * 3,
  //           height: _gameSize * 3,
  //           child: Column(
  //             children: <Widget>[
  //               Row(
  //                 children: <Widget>[
  //                   createContainer(),
  //                   createContainer(),
  //                   createContainer(),
  //                 ],
  //               ),
  //               Row(
  //                 children: <Widget>[
  //                   createContainer(),
  //                   createContainer(),
  //                   createContainer(),
  //                 ],
  //               ),
  //               Row(
  //                 children: <Widget>[
  //                   createContainer(),
  //                   createContainer(),
  //                   createContainer(),
  //                 ],
  //               ),
  //             ],
  //           ));
  //     },
  //   );
  // }
}

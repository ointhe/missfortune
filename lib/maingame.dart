import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainGame{
  var _gameSize;
  var _game;
  var initColor = [
    Colors.black26,
    Colors.black12,
  ];
  MainGame(gameSize){
    _gameSize = gameSize;
    initGame();
  }
  get getGame{
    return _game;
  }
  initGame(){
    var idx = 0;
    _game = Container(
      width: _gameSize*3,
      height: _gameSize*3,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: _gameSize,
                height: _gameSize,
                color: initColor[idx++%2],
              ),
              Container(
                width: _gameSize,
                height: _gameSize,
                color: initColor[idx++%2],
              ),
              Container(
                width: _gameSize,
                height: _gameSize,
                color: initColor[idx++%2],
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                width: _gameSize,
                height: _gameSize,
                color: initColor[idx++%2],
              ),
              Container(
                width: _gameSize,
                height: _gameSize,
                color: initColor[idx++%2],
              ),
              Container(
                width: _gameSize,
                height: _gameSize,
                color: initColor[idx++%2],
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                width: _gameSize,
                height: _gameSize,
                color: initColor[idx++%2],
              ),
              Container(
                width: _gameSize,
                height: _gameSize,
                color: initColor[idx++%2],
              ),
              Container(
                width: _gameSize,
                height: _gameSize,
                color: initColor[idx++%2],
              ),
            ],
          ),
        ],
      )
    );
  }
  
}
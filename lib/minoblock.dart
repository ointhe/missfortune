import 'package:flutter/material.dart';

enum MinoType {
  BLOCK_I_MINO,
  BLOCK_O_MINO,
  BLOCK_Z_MINO,
  BLOCK_L_MINO,
  BLOCK_T_MINO,
}

class MinoBlock {
  var _blockColor;
  var _blockType;
  var _blockPoint = [];
  var _blockSize = 0.0;
  var _block;
  var _bgColor;
  var _blockIdx;
  
  MinoBlock(blocksize,{minoColor = Colors.green,int bidx = 0}) {
    _blockSize = blocksize;
    _blockColor = minoColor;
    _blockIdx = bidx;
    _bgColor = Color.fromRGBO(0, 0, 0, 0);
    var idx = 0;
    minoType(MinoType.BLOCK_Z_MINO);
    _block = Container(
      height: _blockSize*3,
      width: _blockSize*3,
      // color: Colors.black,
      color: _bgColor,
      alignment: Alignment.topLeft,
      child: Column(
        children: <Widget>[
            Row(
            children: <Widget>[
              Container(
                height: _blockSize,
                width: _blockSize,
                color: _blockPoint[idx++] == 1 ? _blockColor : _bgColor,
              ),
              Container(
                height: _blockSize,
                width: _blockSize,
                color: _blockPoint[idx++] == 1 ? _blockColor : _bgColor,
              ),
              Container(
                height: _blockSize,
                width: _blockSize,
                color: _blockPoint[idx++] == 1 ? _blockColor : _bgColor,
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                height: _blockSize,
                width: _blockSize,
                color: _blockPoint[idx++] == 1 ? _blockColor : _bgColor,
              ),
              Container(
                height: _blockSize,
                width: _blockSize,
                color: _blockPoint[idx++] == 1 ? _blockColor : _bgColor,
              ),
              Container(
                height: _blockSize,
                width: _blockSize,
                color: _blockPoint[idx++] == 1 ? _blockColor : _bgColor,
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                height: _blockSize,
                width: _blockSize,
                color: _blockPoint[idx++] == 1 ? _blockColor : _bgColor,
              ),
              Container(
                height: _blockSize,
                width: _blockSize,
                color: _blockPoint[idx++] == 1 ? _blockColor : _bgColor,
              ),
              Container(
                height: _blockSize,
                width: _blockSize,
                color: _blockPoint[idx++] == 1 ? _blockColor : _bgColor,
              ),
            ],
          ),
        ],
      ),
    );

    Container(
      height: _blockSize,
      width: _blockSize,
      color: Colors.white,
      alignment: Alignment.topLeft,
      child: Container(),
    );
  }

  get getBlock =>_block;
  get getBlockColor => _blockColor;
  get getBlockIdx => _blockIdx;
  get getHeight => _blockSize*3;
  get getPoint => _blockPoint;
  void minoType(MinoType minoType) {
    _blockType = minoType;
    switch (_blockType) {
      case MinoType.BLOCK_I_MINO:
        _blockPoint = [
          0, 1, 0,
          0, 1, 0,
          0, 1, 0
        ];
        break;
      case MinoType.BLOCK_L_MINO:
        _blockPoint = [
          1, 0, 0,
          1, 0, 0,
          1, 1, 0
        ];
        break;
      case MinoType.BLOCK_O_MINO:
        _blockPoint = [
          1, 1, 0,
          1, 1, 0,
          0, 0, 0
        ];
        break;
      case MinoType.BLOCK_T_MINO:
        _blockPoint = [
          1, 1, 1,
          0, 1, 0,
          0, 0, 0
        ];
        break;
      case MinoType.BLOCK_Z_MINO:
        _blockPoint = [
          1, 0, 0,
          1, 1, 0,
          0, 1, 0
        ];
        break;
    }
  }
}

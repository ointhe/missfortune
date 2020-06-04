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
  var _blockOpac;
  Widget _getContainer(blockSize, idx, bgColor) {
    return Container(
      height: blockSize,
      width: blockSize,
      color: _blockPoint[idx] == _blockOpac ? _blockColor : bgColor,
    );
  }

  MinoBlock(blocksize, {minoColor = Colors.green, int bidx = 0}) {
    _blockSize = blocksize;
    _blockColor = minoColor;
    _blockIdx = bidx;
    _bgColor = Color.fromRGBO(0, 0, 0, 0);
    var idx = 0;
    minoType(MinoType.BLOCK_Z_MINO);
    _block = Container(
      height: _blockSize * 3,
      width: _blockSize * 3,
      // color: Colors.black,
      color: _bgColor,
      alignment: Alignment.topLeft,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              _getContainer(_blockSize, idx++, _bgColor),
              _getContainer(_blockSize, idx++, _bgColor),
              _getContainer(_blockSize, idx++, _bgColor),
            ],
          ),
          Row(
            children: <Widget>[
              _getContainer(_blockSize, idx++, _bgColor),
              _getContainer(_blockSize, idx++, _bgColor),
              _getContainer(_blockSize, idx++, _bgColor),
            ],
          ),
          Row(
            children: <Widget>[
              _getContainer(_blockSize, idx++, _bgColor),
              _getContainer(_blockSize, idx++, _bgColor),
              _getContainer(_blockSize, idx++, _bgColor),
            ],
          ),
        ],
      ),
    );
  }

  get getBlock => _block;
  get getBlockColor => _blockColor;
  get getBlockIdx => _blockIdx;
  get getHeight => _blockSize * 3;
  get getPoint => _blockPoint;
  void minoType(MinoType minoType) {
    _blockType = minoType;
    switch (_blockType) {
      case MinoType.BLOCK_I_MINO:
        _blockPoint = [0, _blockOpac, 0, 0, _blockOpac, 0, 0, _blockOpac, 0];
        break;
      case MinoType.BLOCK_L_MINO:
        _blockPoint = [
          _blockOpac,
          0,
          0,
          _blockOpac,
          0,
          0,
          _blockOpac,
          _blockOpac,
          0
        ];
        break;
      case MinoType.BLOCK_O_MINO:
        _blockPoint = [
          _blockOpac,
          _blockOpac,
          0,
          _blockOpac,
          _blockOpac,
          0,
          0,
          0,
          0
        ];
        break;
      case MinoType.BLOCK_T_MINO:
        _blockPoint = [
          _blockOpac,
          _blockOpac,
          _blockOpac,
          0,
          _blockOpac,
          0,
          0,
          0,
          0
        ];
        break;
      case MinoType.BLOCK_Z_MINO:
        _blockPoint = [
          _blockOpac,
          0,
          0,
          _blockOpac,
          _blockOpac,
          0,
          0,
          _blockOpac,
          0
        ];
        break;
    }
  }
}

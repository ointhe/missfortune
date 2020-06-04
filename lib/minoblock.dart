import 'package:flutter/material.dart';

enum MinoType {
  BLOCK_I_MINO,
  BLOCK_O_MINO,
  BLOCK_Z_MINO,
  BLOCK_L_MINO,
  BLOCK_T_MINO,
}
enum MinoDirection {
  LEFT,
  RIGHT,
  TOP,
  BOTTOM,
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
  var _position;
  Widget _getContainer(blockSize, idx, bgColor) {
    return Container(
      height: blockSize,
      width: blockSize,
      color: _blockPoint[idx] == _blockOpac ? _blockColor : bgColor,
    );
  }

  MinoBlock(blocksize, minotype, {minoColor = Colors.black, int bidx = 0}) {
    _blockOpac = 0.33;
    _blockSize = blocksize;
    _blockColor = minoColor;
    _blockIdx = bidx;
    _bgColor = Color.fromRGBO(0, 0, 0, 0);
    _position = Offset(0.0, 0.0);
    var idx = 0;
    minoType(minotype);
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
  get getPosition => _position;
  get getType => _blockType;
  set position(p) {
    _position = p;
  }

  set setBgColor(color) {
    _bgColor = color;
  }

  bool movePoint(MinoDirection direction) {
    print('pppp:1');
    var tBlockPoint = _blockPoint.toList();
    switch (direction) {
      case MinoDirection.RIGHT:
        for (var i = 0; i < _blockPoint.length; i += 3) {
          if (tBlockPoint[i + 2] > 0.0) {
            return false;
          }
          tBlockPoint[i + 2] = tBlockPoint[i + 1];
          tBlockPoint[i + 1] = tBlockPoint[i];
          tBlockPoint[i] = 0.0;
        }
        break;
      case MinoDirection.LEFT:
      case MinoDirection.TOP:
      case MinoDirection.BOTTOM:
        for (var i = _blockPoint.length - 1; i >= 0; i--) {
          if (i ~/ 3 > 1) {
            if (tBlockPoint[i] > 0.0) return false;
          } else {
            tBlockPoint[i + 3] = tBlockPoint[i];
            tBlockPoint[i] = 0.0;
          }
        }
        break;
    }
    print('pppp:' + tBlockPoint.toString());
    _blockPoint = tBlockPoint.toList();
    return true;
  }

  void minoType(MinoType minoType) {
    _blockType = minoType;
    switch (_blockType) {
      case MinoType.BLOCK_I_MINO:
        _blockPoint = [
          _blockOpac,
          0.0,
          0.0,
          _blockOpac,
          0.0,
          0.0,
          _blockOpac,
          0.0,
          0.0
        ];
        break;
      case MinoType.BLOCK_L_MINO:
        _blockPoint = [
          _blockOpac,
          0.0,
          0.0,
          _blockOpac,
          0.0,
          0.0,
          _blockOpac,
          _blockOpac,
          0.0
        ];
        break;
      case MinoType.BLOCK_O_MINO:
        _blockPoint = [
          _blockOpac,
          _blockOpac,
          0.0,
          _blockOpac,
          _blockOpac,
          0.0,
          0.0,
          0.0,
          0.0
        ];
        break;
      case MinoType.BLOCK_T_MINO:
        _blockPoint = [
          _blockOpac,
          _blockOpac,
          _blockOpac,
          0.0,
          _blockOpac,
          0.0,
          0.0,
          0.0,
          0.0
        ];
        break;
      case MinoType.BLOCK_Z_MINO:
        _blockPoint = [
          _blockOpac,
          0.0,
          0.0,
          _blockOpac,
          _blockOpac,
          0.0,
          0.0,
          _blockOpac,
          0.0
        ];
        break;
    }
  }
}

import 'package:flutter/material.dart';

class DigitClock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DigitClockPainter(),
      child: Center(),
    );
  }
}

class DigitClockPainter extends CustomPainter {
  static const digitMasks =
  [
    [
      [0,0,1,1,1,0,0],
      [0,1,1,0,1,1,0],
      [1,1,0,0,0,1,1],
      [1,1,0,0,0,1,1],
      [1,1,0,0,0,1,1],
      [1,1,0,0,0,1,1],
      [1,1,0,0,0,1,1],
      [1,1,0,0,0,1,1],
      [0,1,1,0,1,1,0],
      [0,0,1,1,1,0,0]
    ],//0
    [
      [0,0,0,1,1,0,0],
      [0,1,1,1,1,0,0],
      [0,0,0,1,1,0,0],
      [0,0,0,1,1,0,0],
      [0,0,0,1,1,0,0],
      [0,0,0,1,1,0,0],
      [0,0,0,1,1,0,0],
      [0,0,0,1,1,0,0],
      [0,0,0,1,1,0,0],
      [1,1,1,1,1,1,1]
    ],//1
    [
      [0,1,1,1,1,1,0],
      [1,1,0,0,0,1,1],
      [0,0,0,0,0,1,1],
      [0,0,0,0,1,1,0],
      [0,0,0,1,1,0,0],
      [0,0,1,1,0,0,0],
      [0,1,1,0,0,0,0],
      [1,1,0,0,0,0,0],
      [1,1,0,0,0,1,1],
      [1,1,1,1,1,1,1]
    ],//2
    [
      [1,1,1,1,1,1,1],
      [0,0,0,0,0,1,1],
      [0,0,0,0,1,1,0],
      [0,0,0,1,1,0,0],
      [0,0,1,1,1,0,0],
      [0,0,0,0,1,1,0],
      [0,0,0,0,0,1,1],
      [0,0,0,0,0,1,1],
      [1,1,0,0,0,1,1],
      [0,1,1,1,1,1,0]
    ],//3
    [
      [0,0,0,0,1,1,0],
      [0,0,0,1,1,1,0],
      [0,0,1,1,1,1,0],
      [0,1,1,0,1,1,0],
      [1,1,0,0,1,1,0],
      [1,1,1,1,1,1,1],
      [0,0,0,0,1,1,0],
      [0,0,0,0,1,1,0],
      [0,0,0,0,1,1,0],
      [0,0,0,1,1,1,1]
    ],//4
    [
      [1,1,1,1,1,1,1],
      [1,1,0,0,0,0,0],
      [1,1,0,0,0,0,0],
      [1,1,1,1,1,1,0],
      [0,0,0,0,0,1,1],
      [0,0,0,0,0,1,1],
      [0,0,0,0,0,1,1],
      [0,0,0,0,0,1,1],
      [1,1,0,0,0,1,1],
      [0,1,1,1,1,1,0]
    ],//5
    [
      [0,0,0,0,1,1,0],
      [0,0,1,1,0,0,0],
      [0,1,1,0,0,0,0],
      [1,1,0,0,0,0,0],
      [1,1,0,1,1,1,0],
      [1,1,0,0,0,1,1],
      [1,1,0,0,0,1,1],
      [1,1,0,0,0,1,1],
      [1,1,0,0,0,1,1],
      [0,1,1,1,1,1,0]
    ],//6
    [
      [1,1,1,1,1,1,1],
      [1,1,0,0,0,1,1],
      [0,0,0,0,1,1,0],
      [0,0,0,0,1,1,0],
      [0,0,0,1,1,0,0],
      [0,0,0,1,1,0,0],
      [0,0,1,1,0,0,0],
      [0,0,1,1,0,0,0],
      [0,0,1,1,0,0,0],
      [0,0,1,1,0,0,0]
    ],//7
    [
      [0,1,1,1,1,1,0],
      [1,1,0,0,0,1,1],
      [1,1,0,0,0,1,1],
      [1,1,0,0,0,1,1],
      [0,1,1,1,1,1,0],
      [1,1,0,0,0,1,1],
      [1,1,0,0,0,1,1],
      [1,1,0,0,0,1,1],
      [1,1,0,0,0,1,1],
      [0,1,1,1,1,1,0]
    ],//8
    [
      [0,1,1,1,1,1,0],
      [1,1,0,0,0,1,1],
      [1,1,0,0,0,1,1],
      [1,1,0,0,0,1,1],
      [0,1,1,1,0,1,1],
      [0,0,0,0,0,1,1],
      [0,0,0,0,0,1,1],
      [0,0,0,0,1,1,0],
      [0,0,0,1,1,0,0],
      [0,1,1,0,0,0,0]
    ],//9
    [
      [0,0,0,0],
      [0,0,0,0],
      [0,1,1,0],
      [0,1,1,0],
      [0,0,0,0],
      [0,0,0,0],
      [0,1,1,0],
      [0,1,1,0],
      [0,0,0,0],
      [0,0,0,0]
    ]//:
  ];

  static const int digitRows = 10;
  static const int digitColumns = 7;
  static const int seperatorColumns = 6;
  static const int spaceColumns = 1;
  static const int digitsPerGroup = 2;

  double _startX, _startY, _diameter;

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Offset.zero & size;
    double width = rect.width, height = rect.height;

    _initialRadiusOriginPoint(width, height);
    _draw(canvas);
  }

  @override
  bool shouldRepaint(DigitClockPainter oldDelegate) {
    return true;
  }

  void _initialRadiusOriginPoint(double width, height) {
    const int margin = 1;
    const int totalRows = digitRows + 2 * margin;
    const int totalColumn = margin + (digitsPerGroup * digitColumns + spaceColumns) * 3 + seperatorColumns * 2 + margin;
    double xDiameter, yDiameter;

    xDiameter = height / totalRows;
    yDiameter = width / totalColumn;

    _diameter = (xDiameter > yDiameter) ? yDiameter : xDiameter;
    _startX = ((width - _diameter * totalColumn) / 2) + _diameter;
    _startY = ((height - _diameter * totalRows) / 2) + _diameter;
  }

  void _draw(Canvas canvas) {
    DateTime now = DateTime.now();

    _drawGroup(canvas, now.hour);
    _drawSeperator(canvas);
    _drawGroup(canvas, now.minute);
    _drawSeperator(canvas);
    _drawGroup(canvas, now.second);
  }

  void _drawGroup(Canvas canvas, int group) {
    const int base = 10;
    int left = group ~/ base;
    int right = group % base;

    _drawDigit(canvas, left);
    _drawSpace(canvas);
    _drawDigit(canvas, right);
  }

  void _drawDigit(Canvas canvas, int digit) {
    var mask = digitMasks[digit];
    Paint paint = Paint()..color = Colors.cyan;

    var x = _startX, y = _startY;
    for (int i = 0; i < digitRows; i++) {
      x = _startX;
      for (int j = 0; j < digitColumns; j++) {
        if (mask[i][j] != 0) {
          canvas.drawCircle(Offset(x + 1, y), _diameter * 0.5 - 1, paint);
        }
        x += _diameter;
      }
      y += _diameter;
    }

    _startX = x;
  }

  void _drawSpace(Canvas canvas) {
    _startX += _diameter * spaceColumns;
  }

  void _drawSeperator(Canvas canvas) {
    var mask = digitMasks[10];
    Paint paint = Paint()..color = Colors.cyan;

    _startX += _diameter;

    var x = _startX, y = _startY;
    for (int i = 0; i < digitRows; i++) {
      x = _startX;
      for (int j = 0; j < seperatorColumns - 2; j++) {
        if (mask[i][j] != 0) {
          canvas.drawCircle(Offset(x + 1, y), _diameter * 0.5 - 1, paint);
        }
        x += _diameter;
      }
      y += _diameter;
    }

    _startX = x + _diameter;
  }
}

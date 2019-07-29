import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class Background extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BackgroundState();
  
}

class BackgroundState extends State<Background> {
  Timer _timer;

  void _timerHandler(Timer timer) {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(Duration(milliseconds: 150), this._timerHandler);
  }

  @override
  void dispose() {
    super.dispose();

    _timer.cancel();
  }
 
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: BackgroundPainter(),
      child: Center(),
    );
  }
}

class BackgroundPainter extends CustomPainter {
  static const int counts = 36;
  static List<Circle> _circles = List(counts);
  static bool _initialized = false;

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Offset.zero & size;
    Random _generator = Random.secure();

    _initialCircles(rect, _generator);
    _drawBackground(canvas, rect);
    _drawCircles(canvas, _generator);
  }

  void _drawBackground(Canvas canvas, Rect rect) {
    canvas.drawRect(rect, Paint()..color = Colors.white);
  }

  void _initialCircles(Rect rect, Random random) {
    if (_initialized) 
      return;

    for (int i = 0; i < counts; i++) {
      double x = random.nextInt(rect.width.floor()).roundToDouble();
      double y = random.nextInt(rect.height.floor()).roundToDouble();
      double r = random.nextInt(rect.width.floor() >> 3).roundToDouble();

      _circles[i] = Circle(x: x, y: y, radius: r, maxX: rect.width, maxY: rect.height);
      _circles[i].initialize(random);
    }

    _initialized = true;
  }

  void _drawCircles(Canvas canvas, Random random) {
    final Paint paint = new Paint();

    for (int i = 0; i < counts; i++) {
      Circle circle = _circles[i];

      circle.move();

      double baseOpacity = random.nextDouble();
      if (baseOpacity < 0.6) {
        baseOpacity = 0.6;
      }
      if (baseOpacity > 0.9) {
        baseOpacity = 0.9;
      }

      Gradient gradient = new RadialGradient(
        colors: <Color>[
          Colors.purple.withOpacity(baseOpacity * 0.9),
          Colors.purple.withOpacity(baseOpacity * 0.8),
          Colors.purple.withOpacity(baseOpacity * 0.6),
          Colors.purple.withOpacity(baseOpacity * 0.4),
          Colors.purple.withOpacity(baseOpacity * 0.1),
        ],
        stops: [
          0.0,
          0.3,
          0.6,
          0.8,
          1.0,
        ],
      );
      paint.shader = gradient.createShader(Rect.fromCircle(center: circle.offset, radius: circle.r));
      canvas.drawCircle(circle.offset, circle.r, paint);
    }
  }

  @override
  bool shouldRepaint(BackgroundPainter oldDelegate) {
    return true;
  }
}

class Circle {
  static const double minRadius = 20.5;
  static const double maxRadius = 48.5;
  static const double xDirectionRatio = 2.5;
  static const double yDirectionRatio = 4.0;
  static const int movesReverse = 57;
  static const double radiusDelta = 1.2;
  static const int radiusReverse = 17;

  double x, y, r, xDirection, yDirection, maxX, maxY, _rDelta;
  int _moves = 0;
  int _radiusCounter = 0;

  Circle({this.x, this.y, double radius, this.maxX, this.maxY}) {
    if (radius < minRadius) {
      radius = minRadius;
    }

    if (radius > maxRadius) {
      radius = maxRadius;
    }

    r = radius;
  }

  void initialize(Random random) {
    double xDir = random.nextDouble();
    xDirection =  (xDir > 0.5) ? xDirectionRatio : -xDirectionRatio;

    double yDir = random.nextDouble();
    yDirection =  (yDir > 0.5) ? yDirectionRatio : -yDirectionRatio;

    double rDelta = random.nextDouble();
    _rDelta = (rDelta > 0.5) ? radiusDelta : -radiusDelta;
  }

  void move() {
    x += xDirection;
    y += yDirection;

    _moves += 1;
    if (_moves == movesReverse) {
      _moves = 0;
      xDirection = -xDirection;
      yDirection = -yDirection;
    }

    r += _rDelta;
    _radiusCounter += 1;
    if (_radiusCounter == radiusReverse) {
      _radiusCounter = 0;
      _rDelta = -_rDelta;
    }
  }

  Offset get offset => Offset(x, y);

}

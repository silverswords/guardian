import 'dart:math' as math;
import 'dart:async';

import 'package:flutter/material.dart';

class Wave extends StatefulWidget { 
  @override 
 _WaveState createState() => _WaveState(); 
}

class _WaveState extends State<Wave> {
  Timer _timer;

  void _timerHandler(Timer timer) {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(Duration(milliseconds: 50), this._timerHandler);
  }

  @override
  void dispose() {
    super.dispose();

    _timer.cancel();
  }

  @override 
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(1),
      child: Container(
        child: CustomPaint(
          painter: WavePainter(),
        ),
        alignment: Alignment.centerLeft
      )
    );
  }
}

randomNormal(base, dev, math.Random random) {
  var result;
  result = (base.roundToDouble() + dev.roundToDouble()) - random.nextDouble() * dev * 2;
  return result;
}

class WavePainter extends CustomPainter {
  static const int particles_num = 50;
  static List<WaveParticle> particles = List();

  @override
  void paint(Canvas canvas, Size size) {
    math.Random _generator = math.Random.secure();
    
    _createWave(_generator);
    _drawWave(canvas, _generator);
  }

  void _createWave(math.Random random) {
    for (int i = 0; i < 1; i++) {
      var now = new DateTime.now();
      particles.add(WaveParticle(x: -2, y: -2, radius: random.nextDouble() * 5, random: random, time: now));
    }

    if (particles.length > 600) {
      return;
    }
  }

  void _drawWave(Canvas canvas, math.Random random) {
    final Paint paint = Paint();
    for (int i = 0; i < particles.length; i++) {
      var now = new DateTime.now();
      WaveParticle waveParticle = particles[i];
      paint.color = waveParticle.color;
      canvas.drawCircle(waveParticle.offset, waveParticle.r, paint);
      waveParticle.move(now);
    }
  }

  @override
  bool shouldRepaint(WavePainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(WavePainter oldDelegate) => true;
}

class WaveParticle {
  static const double maxRadius = 10.0;
  static const double minRadius = 1.0;
  static const double particles_size = 0.5;
  static const int speed = 10000;

  Color color = Color(0);
  double x, y, r, diameter, duration, amplitude, offsetY, startTime, arc, baseSpeed;

  WaveParticle({this.x, this.y, double radius, math.Random random, time}) {
    if (radius < minRadius) {
      radius = minRadius;
    }
    if (radius > maxRadius) {
      radius = maxRadius;
    }
    r = radius;
    diameter = math.max(0, randomNormal(particles_size, particles_size / 2, random));
    duration = randomNormal(speed, speed * 0.1, random);
    amplitude = randomNormal(24.0, 2.0, random);
    offsetY = randomNormal(0.0, 10.0, random);
    startTime = time.millisecondsSinceEpoch - random.nextDouble();
    color = Color.fromRGBO(255, randomNormal(125, 20, random).round(), 50, random.nextDouble());
    arc = math.pi * 2;
  }

  Offset get offset => Offset(x, y);

  move(now) {
    var progress = ((now.millisecondsSinceEpoch - startTime) % duration) / duration;

    x += 1;
    y = ((math.sin(progress * arc) * amplitude) + offsetY);
  }
}

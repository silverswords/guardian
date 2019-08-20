import 'package:flutter/material.dart';
import 'package:flare_flutter/flare.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controller.dart';
import 'package:flare_dart/math/mat2d.dart';

import 'package:guardian/global.dart';

class IndicatorWidget extends StatelessWidget with FlareController {
  IndicatorWidget.idle({this.onComplete})
    : state = 0,
      animation = 'idle';

  IndicatorWidget.correct({this.onComplete})
    : state = 1,
      animation = 'success';
  IndicatorWidget.error({this.onComplete})
    : state = -1, 
      animation = 'fail';

  final int state;
  final String animation;
  final VoidCallback onComplete;

  @override
  Widget build(BuildContext context) {
    return _buildIndicator(context, animation);
  }

  Widget _buildIndicator(BuildContext context, String animation) {
    return Container(
      height: 300,
      child: FlareActor(
        Resources.flareTeddy,
        fit: BoxFit.contain,
        alignment: Alignment.center,
        animation: animation,
        controller: this,
      ),
    );
  }

  @override
  bool advance(FlutterActorArtboard artboard, double elapsed) {
    return false;
  }

  @override
  void initialize(FlutterActorArtboard artboard) {}

  @override
  void setViewTransform(Mat2D viewTransform) {}
}

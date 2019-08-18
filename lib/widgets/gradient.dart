import 'package:flutter/material.dart';

class GradientWidget extends StatelessWidget {
  final List<Color> colors;

  GradientWidget({@required this.colors});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: generateColors(colors)
        ),
      ),
      curve: Curves.linear,
      duration: Duration(milliseconds: 500),
    );
  }

  List<Color> generateColors(List<Color> colors) {
    if (colors[0] is MaterialColor) {
      final MaterialColor color = colors[0];
      return [
        color[100],
        color[300],
        color[400],
        color[600],
      ];
    } else {
      return colors;
    }
  }
}

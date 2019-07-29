import 'package:flutter/material.dart';
import 'package:guardian/global.dart';
import './background.dart';

class Landing extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Background(),
          Container(
            child: DigitClock(),
          )
        ],
      ),
    );
  }
}

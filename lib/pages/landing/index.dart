import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:guardian/global.dart';
import './layout.dart';

class Landing extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            child: SvgPicture.asset(
              Resources.svgDive,
              // color: Colors.black12,
              fit: BoxFit.fitHeight,
            ),
          ),
          Container(
            child: Layout(),
          )
        ],
      ),
    );
  }
}

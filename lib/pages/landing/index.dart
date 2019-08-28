import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:guardian/global.dart';
import './layout.dart';

class Landing extends StatelessWidget {
  static const routeName = '/';

  const Landing();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            child: SvgPicture.asset(
              Resources.svgDive,
              fit: BoxFit.fitHeight,
              color: Color(0x772C003E),
              colorBlendMode: BlendMode.hardLight,
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

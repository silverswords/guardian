import 'package:flutter/material.dart';
import './background.dart';
import './layout.dart';

class Landing extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Background(),
          Container(
            child: Layout(),
          )
        ],
      ),
    );
  }
}

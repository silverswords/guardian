import 'package:flutter/material.dart';
import './background.dart';

class Landing extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Background()
      ),
    );
  }
}

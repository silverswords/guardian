import 'package:flutter/material.dart';

class Landing extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Landing',
            ),
          ],
        ),
      ),
    );
  }
}
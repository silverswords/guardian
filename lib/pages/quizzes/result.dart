import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

import 'package:guardian/global.dart';

class ResultWidget extends StatelessWidget {
  const ResultWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            height: 300,
            child: FlareActor(
              Resources.flareTrophy,
              fit: BoxFit.contain,
              alignment: Alignment.center,
              animation: 'trophy',
            ),
          ),
          Container(
            height: 48,
            child: FlatButton(
              padding: EdgeInsets.only(
                left: 48,
                right: 48,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                '返回首页'
              ),
              textColor: Color(0xffff935c),
              textTheme: ButtonTextTheme.primary,
              color: Color(0xccd2fafb),
            ),
          ),
        ],
      ),
    );
  }
}

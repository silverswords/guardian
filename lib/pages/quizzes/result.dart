import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'package:guardian/global.dart';

class ResultWidget extends StatelessWidget {
  const ResultWidget();

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<QuizStore>(context);

    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
            top: 80,
          ),
          height: 320,
          child: SvgPicture.asset(
            Resources.svgResultBackground,
            //color: Colors.black12,
            fit: BoxFit.fitHeight,
          ),
        ),
        SafeArea(
          child: Container(
            margin: EdgeInsets.only(
              top: 420,
            ),
            child: Column(
              children: <Widget>[
                Container(
                  height: 80,
                  child: Observer(
                    builder: (_) {
                      return Text('学习完成，有 ${store.errors} 个错误',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.lightBlue,
                          fontSize: 24,
                        ),
                      );
                    }
                  ),
                ),
                Container(
                  height: 120,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      '返回首页'
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

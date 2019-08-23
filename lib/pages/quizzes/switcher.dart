import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'package:guardian/global.dart';
import './quiz.dart';
import './result.dart';

class SwitcherWidget extends StatelessWidget {
  const SwitcherWidget();

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<QuizStore>(context);

    return Stack(
      children: <Widget>[
        Container(
          //color: Color(0xCCFFF1E9),
          color: Color(0xCCDFF0EA),
        ),
        Container(
          child: SvgPicture.asset(
            Resources.svgDinosaur,
            color: Colors.black12,
            fit: BoxFit.fitHeight,
          ),
        ),
        SafeArea(
          child: Observer(
            builder: (_) {
              if (store.isFinished()) {
                return ResultWidget();
              }

              return QuizWidget();
            },
          ),
        ),
      ],
    );
  }
}

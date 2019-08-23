import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'package:guardian/global.dart';
import './switcher.dart';

class Quizzes extends StatelessWidget {
  static const List<String> quizTitles = ['安全教育', '防毒教育'];
  static const routeName = '/quiz';

  const Quizzes();

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<QuizStore>(context);

    return Scaffold(
      appBar: AppBar(
        title: Observer(
          builder: (_) => Text(quizTitles[store.type])
        ),
      ),
      body: Container(
        child: SwitcherWidget(),
      )
    );
  }
}

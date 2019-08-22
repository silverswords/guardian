import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'package:guardian/global.dart';

class ResultWidget extends StatelessWidget {
  const ResultWidget();

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<QuizStore>(context);

    return Container(
      child: Observer(
        builder: (_) => Text('Errors ${store.errors}'),
      ),
    );
  }
}

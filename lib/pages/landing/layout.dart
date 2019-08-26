import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:guardian/global.dart';
import 'package:guardian/pages/quizzes/index.dart';
import './tile.dart';

class Layout extends StatelessWidget {
  const Layout();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(
          top: 100.0,
          bottom: 100.0,
          left: 20.0,
          right: 20.0,
        ),
        child: Column(
          children: <Widget>[
            // Row I
            Expanded(
              flex: 1,
              child: Container(
                constraints: BoxConstraints.expand(),
                margin: EdgeInsets.only(top: 12.0),
                decoration: BoxDecoration(
                  color: Color(0xCCFBC99D),
                  borderRadius: BorderRadius.circular(4.0),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Color(0x99FBC99D),
                      offset: Offset(6.0, 6.0),
                      blurRadius: 4.0,
                      spreadRadius: 0.8,
                    ),
                  ],
                ),
                child: Wave()
              ),
            ),
            // Row II
            Expanded(
              flex: 1,
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () => _onSecurityTapped(context),
                      child: Container(
                        margin: EdgeInsets.only(top: 12.0),
                        decoration: BoxDecoration(
                          color: Color(0xCC5EDFFF),
                          borderRadius: BorderRadius.circular(4.0),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: Color(0x995EDFFF),
                              offset: Offset(6.0, 6.0),
                              blurRadius: 4.0,
                              spreadRadius: 0.8,
                            ),
                          ],
                        ),
                        child: TileWidget(path: Resources.svgSuburbs, title: '安全教育',),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () => _onDrugTapped(context),
                      child :Container(
                        margin: EdgeInsets.only(top: 12.0, left: 12.0),
                        decoration: BoxDecoration(
                          color: Color(0xCC8BBABB),
                          borderRadius: BorderRadius.circular(4.0),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: Color(0x998BBABB),
                              offset: Offset(6.0, 6.0),
                              blurRadius: 4.0,
                              spreadRadius: 0.8,
                            ),
                          ],
                        ),
                        child: TileWidget(path: Resources.svgMedicine, title: '防毒品教育')
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Row III
            Expanded(
              flex: 1,
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(top: 12.0),
                      decoration: BoxDecoration(
                        color: Color(0xCCE9E5DD),
                        borderRadius: BorderRadius.circular(4.0),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Color(0x99E9E5DD),
                            offset: Offset(6.0, 6.0),
                            blurRadius: 4.0,
                            spreadRadius: 0.8,
                          ),
                        ],
                      ),
                      child: TileWidget(path: Resources.svgTeam, title: '制作人员')
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(top: 12.0, left: 12.0),
                      decoration: BoxDecoration(
                        color: Color(0xCCF9D276),
                        borderRadius: BorderRadius.circular(4.0),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Color(0x99F9D276),
                            offset: Offset(6.0, 6.0),
                            blurRadius: 4.0,
                            spreadRadius: 0.8,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onSecurityTapped(BuildContext context) {
    final store = Provider.of<QuizStore>(context);
    store.load(QuizTypeSecurity);

    Navigator.pushNamed(
      context,
      Quizzes.routeName,
    );
  }

  void _onDrugTapped(BuildContext context) {
    final store = Provider.of<QuizStore>(context);
    store.load(QuizTypeDrug);

    Navigator.pushNamed(
      context,
      Quizzes.routeName,
    );
  }
}

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
                  color: Color(0xCCFFF6BA),
                  borderRadius: BorderRadius.circular(4.0),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Color(0x99FFF6BA),
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
                          color: Color(0xCCFF9281),
                          borderRadius: BorderRadius.circular(4.0),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: Color(0x99FF9281),
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
                          color: Color(0xCCB9CAFF),
                          borderRadius: BorderRadius.circular(4.0),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: Color(0x99B9CAFF),
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
                        color: Color(0xCC8681FF),
                        borderRadius: BorderRadius.circular(4.0),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Color(0x998681FF),
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
                        color: Color(0xCCFFB181),
                        borderRadius: BorderRadius.circular(4.0),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Color(0x99FFB181),
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

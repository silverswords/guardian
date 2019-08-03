import 'package:flutter/material.dart';
//import 'package:guardian/widgets/digit-clock.dart';
import 'package:guardian/global.dart';

class Layout extends StatelessWidget {
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
                  color: Color(0xeefbc99d),
                  borderRadius: BorderRadius.circular(4.0),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Color(0x99fbc99d),
                      offset: Offset(6.0, 6.0),
                      blurRadius: 4.0,
                      spreadRadius: 0.8,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(1),
                  child: Container(
                    child: Wave(),
                    alignment: Alignment.centerLeft
                  )
                )
              ),
            ),
            // Row II
            Expanded(
              flex: 1,
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(top: 12.0),
                      decoration: BoxDecoration(
                        color: Color(0xee5edfff),
                        borderRadius: BorderRadius.circular(4.0),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Color(0x995edfff),
                            offset: Offset(6.0, 6.0),
                            blurRadius: 4.0,
                            spreadRadius: 0.8,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(top: 12.0, left: 12.0),
                      decoration: BoxDecoration(
                        color: Color(0xee8bbabb),
                        borderRadius: BorderRadius.circular(4.0),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Color(0x998bbabb),
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
                        color: Color(0xeee9e5dd),
                        borderRadius: BorderRadius.circular(4.0),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Color(0x99e9e5dd),
                            offset: Offset(6.0, 6.0),
                            blurRadius: 4.0,
                            spreadRadius: 0.8,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(top: 12.0, left: 12.0),
                      decoration: BoxDecoration(
                        color: Color(0xeef9d276),
                        borderRadius: BorderRadius.circular(4.0),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Color(0x99f9d276),
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
}

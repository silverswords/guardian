import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TileWidget extends StatelessWidget {
  const TileWidget({@required this.path, @required this.title});

  final String path;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 8,
        bottom: 8,
        left: 12,
        right: 12,
      ),
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Container(
              child: SvgPicture.asset(
                path,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Text(title,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.yellowAccent,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

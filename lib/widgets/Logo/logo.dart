import 'package:app/theme/ripple.dart';
import 'package:flutter/material.dart';

import './logo.i18n.dart';

class Logo extends StatelessWidget {
  final double fontSize;
  final Color color;

  const Logo({Key key,
              @required this.fontSize,
              @required this.color}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        new Icon(
          RippleIcons.logo,
          size: fontSize * 2,
          color: color,
        ),

        new Padding(
          padding: new EdgeInsets.only(
            left: fontSize * 0.2
          ),
        
          child: new Text( 
            'Housify'.i18n,
            style: new TextStyle(
              color: color,
              fontSize: fontSize,
              fontFamily: 'Roobert',
              fontWeight: FontWeight.w400,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        )
      ]
    );
  }
}
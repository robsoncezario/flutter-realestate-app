import 'package:flutter/material.dart';

final ThemeData dark = new ThemeData(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  primaryColor: const Color.fromRGBO(217, 83, 165, 1),

  scaffoldBackgroundColor: const Color.fromRGBO(0, 0, 0, 1),
  buttonColor: const Color.fromRGBO(24, 24, 24, 1),
  hoverColor: const Color.fromRGBO(44, 44, 44, 1),
  dividerColor: const Color.fromRGBO(17, 17, 17, 1),
  canvasColor: const Color.fromRGBO(0, 0, 0, 1),

  appBarTheme: new AppBarTheme(
    brightness: Brightness.dark,
    color: const Color.fromRGBO(0, 0, 0, 1),
    elevation: 0.0
  ),

  iconTheme: new IconThemeData(
    color: const Color.fromRGBO(246, 246, 246, 1)
  ),

  tooltipTheme: new TooltipThemeData(
    padding: const EdgeInsets.only(
      left: 10,
      right: 10
    ),
    decoration: const BoxDecoration(
      color: const Color.fromRGBO(24, 24, 24, 1),
      borderRadius: const BorderRadius.all(
        const Radius.circular(4)
      ),
      boxShadow: [
        const BoxShadow(
          color: const Color.fromRGBO(246, 246, 246, .6),
          blurRadius: 5.0, 
          spreadRadius: 1.0, 
          offset: const Offset(0.0, 0.0),
        )
      ],
    )
  ),

  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
  
  fontFamily: 'Roobert',

  navigationRailTheme: new NavigationRailThemeData(
    elevation: 0.0,
    backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
    selectedIconTheme: new IconThemeData(
      color: const Color.fromRGBO(217, 83, 165, 1)
    ),
    unselectedIconTheme: new IconThemeData(
      color: const Color.fromRGBO(246, 246, 246, 1),
    ),
    selectedLabelTextStyle: const TextStyle(
      fontFamily: 'Roobert',
      fontWeight: FontWeight.w300,
			fontSize: 18,
      color: const Color.fromRGBO(217, 83, 165, 1)
    ),
    unselectedLabelTextStyle: const TextStyle(
      fontFamily: 'Roobert',
      fontWeight: FontWeight.w300,
			fontSize: 18,
      color: const Color.fromRGBO(246, 246, 246, 1),
    ),
    labelType: NavigationRailLabelType.all,
  ),

  textTheme: const TextTheme(
    headline1: const TextStyle(
      color: const Color.fromRGBO(246, 246, 246, 1),
      fontFamily: 'Roobert',
			fontSize: 32,
      fontWeight: FontWeight.w500
    ),

    subtitle1: const TextStyle(
      color: const Color.fromRGBO(246, 246, 246, 1),
      fontFamily: 'Roobert',
			fontSize: 18,
      fontWeight: FontWeight.w500
    ),

    subtitle2: const TextStyle(
      color: const Color.fromRGBO(210, 210, 210, 1),
      fontFamily: 'Roobert',
			fontSize: 15,
      fontWeight: FontWeight.w300
    ),

    caption: const TextStyle(
      color: const Color.fromRGBO(210, 210, 210, 1),
      fontFamily: 'Roobert',
			fontSize: 14,
      fontWeight: FontWeight.w400
    ),
  )
);
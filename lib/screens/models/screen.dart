import 'package:flutter/material.dart';
import 'package:app/theme/ripple.dart';

import 'package:app/screens/home/home.dart';

class Screen {
  final String route;
  final String title;
  final String tooltip;
  final IconData icon;
  final IconData activeIcon;
  final Widget widget;
  int notifications = 0;
  int currentRoute = 0;

  bool get hasNotifications => notifications > 0;

  Screen({
    this.route,
    this.title,
    this.tooltip,
    this.icon,
    this.activeIcon,
    this.widget});

  static final List<Screen> collection = [
    new Screen(
      route: '/home',
      title: 'Home',
      tooltip: 'Initial page',
      icon: RippleIcons.homeOutline,
      activeIcon: RippleIcons.home,
      widget: new HomeScreen()
    ),

    new Screen(
      route: '/explore',
      title: 'Explore',
      tooltip: 'Discover what\'s around you',
      icon: RippleIcons.mapOutline,
      activeIcon: RippleIcons.map,
      widget: new Container(color: Colors.red)
    ),

    new Screen(
      route: '/favorites',
      title: 'Favorites',
      tooltip: 'My favorites',
      icon: RippleIcons.heartOutline,
      activeIcon: RippleIcons.heart,
      widget: new Container(color: Colors.green),
    )
  ];
}
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import '../models/screen.dart';

class NavigationBloc with ChangeNotifier {
  int _index = 0;
  int get index => _index;

  set index(int _newIndex) {
    _index = _newIndex;
    removeNotifications(_newIndex);
    notifyListeners();
  }

  void addNotification(int screen) {
    if(_index != screen) {
      Screen
        .collection[screen]
        .notifications++;
    }

    notifyListeners();
  }

  void removeNotifications(int screen, {bool silently = true}) {
    Screen
      .collection[screen]
      .notifications = 0;

    if(silently == false) {
      notifyListeners();
    }
  }  
}
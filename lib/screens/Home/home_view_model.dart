import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pmvvm/pmvvm.dart';

class HomeViewModel extends ViewModel {
  int currentIndex = 0;
  List<IconData> navigationIcons = [
    FontAwesomeIcons.calendarDays,
    FontAwesomeIcons.check,
    FontAwesomeIcons.user
  ];

  onIconChanged(index) {
    currentIndex = index;
    notifyListeners();
  }
}

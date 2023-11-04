import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pmvvm/pmvvm.dart';


class HomeViewModel extends ViewModel {
  String id ='';

  int currentIndex = 1;
  List<IconData> navigationIcons = [
    FontAwesomeIcons.calendarDays,
    FontAwesomeIcons.check,
    FontAwesomeIcons.user
  ];

  onIconChanged(index) {
    currentIndex = index;
    notifyListeners();
  }


  @override
  void init() {
    super.init();
  }

}

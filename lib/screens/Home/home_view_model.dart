import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pmvvm/pmvvm.dart';

import '../../models/user_model.dart';

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
    // getId();
  }
  // void getId()async{
  //   QuerySnapshot snap  = await FirebaseFirestore.instance.collection("Employee").where("email" , isEqualTo: User.userName).get();
  //   User.id = snap.docs[0].id;
  //   notifyListeners();
  // }
}

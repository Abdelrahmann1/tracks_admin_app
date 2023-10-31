import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:pmvvm/pmvvm.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:tracks_admin_app/models/user_model.dart';

class TodayTaskViewModel extends ViewModel {
  String checkIn = "--/--";
  String checkOut = "--/--";
  final GlobalKey<SlideActionState> key = GlobalKey();
  Future<dynamic> getName() async {
    final prefs = await SharedPreferences.getInstance();
    String? name = prefs.getString('EmployeeEmail');
    User.userName = name!;
    notifyListeners();
  }
  void getRecord() async {
    try {
      QuerySnapshot snap = await FirebaseFirestore.instance
          .collection("Employee")
          .where("email", isEqualTo: User.userName)
          .get();
      DocumentSnapshot snap2 = await FirebaseFirestore.instance
          .collection("Employee")
          .doc(snap.docs[0].id)
          .collection("Records")
          .doc(DateFormat("dd MMMM yyyy").format(DateTime.now()))
          .get();
      checkIn = snap2['checkIn'];
      checkOut = snap2['checkOut'];
      notifyListeners();
    } catch (e) {
      checkIn ="--/--";
      checkOut ="--/--";
      notifyListeners();
    }
  }
  @override
  void init() {
    super.init();
    getName();
    getRecord();
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:pmvvm/pmvvm.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:csv/csv.dart';
class ProfileViewModel extends ViewModel {
  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      final sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.remove("uidToken");
      SystemNavigator.pop();
      print('User logged out');
    } catch (e) {
      print('Error signing out: $e');
    }
  }

  void exportData() async {
    final CollectionReference leadsData = FirebaseFirestore.instance.collection("leads form excel");
    final myData = await rootBundle.loadString("assets/Excel/leads.csv");
    List<List<dynamic>> csvTable = const CsvToListConverter().convert(myData);
    List<List<dynamic>> data = [];
    data = csvTable;
    for (var i = 0; i < data.length; i++) {
      var record = {
        "lead_ID": data[i][0],
        "Lead_name": data[i][1],
        "lead_phone": data[i][2],
        "lead_email": data[i][3],
        "lead_status": data[i][4],
        "number_of_calls": data[i][5],
        "number_of_answer": data[i][6],
        "number_of_whatsapp": data[i][7],
        "last_action_date": data[i][8],
        "entry_date": data[i][9],
        "lead_source": data[i][10],
        "user_in_charge": data[i][11],
        "tags": data[i][12],
        "list_name": data[i][13],
        "meeting": data[i][14],
      };
      leadsData.add(record);
    }
  }
}

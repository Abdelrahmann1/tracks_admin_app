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
    for (var i = 1; i < data.length; i++) {
      var record = {
        "lead_ID": data[i][0],
        "Lead_name": data[i][1],
        "lead_phone": data[i][2],
        "lead_email": data[i][3],
        "Additional number": data[i][4],
        "unit type": data[i][6],
        "job tittle": data[i][7],
        "job": data[i][8],
        "Company": data[i][9],
        "Website": data[i][10],
        "facebook": data[i][11],
        "Status": data[i][12],
        "Number of calls": data[i][13],
        "Number of no answer": data[i][14],
        "Number of no Whatsapp": data[i][15],
        "Last comment": data[i][16],
        "Last action date": data[i][17],
        "Entry date": data[i][18],
        "Lead Source": data[i][19],
        "User in charge": data[i][20],
        "Tags": data[i][21],
        "List Name": data[i][22],
        "Meeting": data[i][23],
        "Last Sales Date": data[i][24],
        "last Sales Value": data[i][25],
        "Last Sales Person In charge": data[i][26],
        "Meeting": data[i][23],

      };

      leadsData.add(record);
    }
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:pmvvm/pmvvm.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
}


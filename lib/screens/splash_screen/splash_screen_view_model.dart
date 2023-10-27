import 'package:pmvvm/pmvvm.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tracks_admin_app/models/user_model.dart';
import 'package:tracks_admin_app/utils/app_router.dart';
class SplashScreenViewModel extends ViewModel {
  Future<dynamic> delay() async {
    Future.delayed(const Duration(seconds: 5), () async {});
     final prefs = await SharedPreferences.getInstance();
    final String? uidTokenFromUser = prefs.getString('EmployeeEmail');
    String userName =prefs.getString('EmployeeEmail')!;
    userName= User.userName;
    if (uidTokenFromUser == null){
      Navigator.pushReplacementNamed(context, AppRouter.onboardingScreen);
    }else{
      Navigator.pushReplacementNamed(context, AppRouter.homeScreen);
    }
  }
  @override
  void init() {
    super.init();
    delay();
  }
}

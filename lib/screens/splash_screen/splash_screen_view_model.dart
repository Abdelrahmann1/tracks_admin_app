import 'package:pmvvm/pmvvm.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tracks_admin_app/utils/app_router.dart';
class SplashScreenViewModel extends ViewModel {
  Future<dynamic> delay() async {
    Future.delayed(const Duration(seconds: 1), () async {});
     final prefs = await SharedPreferences.getInstance();
    final String? uidTokenFromUser = prefs.getString('EmployeeEmail');
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

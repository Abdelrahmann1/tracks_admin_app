import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:pmvvm/pmvvm.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tracks_admin_app/controller/puplic.dart';
import 'package:tracks_admin_app/models/user_model.dart';
import 'package:tracks_admin_app/utils/app_router.dart';

class SplashScreenViewModel extends ViewModel {
  Future<dynamic> delay() async {
    PublicController publicController = Get.put((PublicController()));
    Future.delayed(const Duration(seconds: 3), () async {});
    final prefs = await SharedPreferences.getInstance();
    final String? uidTokenFromUser = prefs.getString('uidToken');
    if (uidTokenFromUser == null) {
      Navigator.pushReplacementNamed(context, AppRouter.onboardingScreen);
    } else {
      publicController.uid = uidTokenFromUser;
      Navigator.pushReplacementNamed(context, AppRouter.homeScreen);
    }
  }
  void getUserInfo() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    Users.id = sharedPreferences.getString("uidToken")!;
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      String? email = user.email;

      if (email != null) {
        Users.userName = email;
        print(Users.userName);
      } else {
        Users.userName = "Emp";

        print("User email is null");
      }
    } else {
      print("User is not authenticated");
    }
  }

  checkAuth() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
  }
  PublicController publicController = Get.put((PublicController()));


  @override
  void init() {
    super.init();
    checkAuth();
    delay();
    getUserInfo();
    print(publicController.uid);

  }
}

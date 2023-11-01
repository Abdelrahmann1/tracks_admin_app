import 'package:flutter/material.dart';
import 'package:tracks_admin_app/screens/Home/home_view.dart';
import 'package:tracks_admin_app/screens/Leads/add_lead_note.dart';

import '../screens/Leads/LeadsDetail.dart';
import '../screens/Leads/LeadsListView.dart';
import '../screens/onboding/onboding_screen.dart';

class AppRouter {
  static const String homeScreen = "/HomeScreen";
  static const String onboardingScreen = "/OnBoardingScreen";
  static const String leadsScreen = "/LeadsScreen";
  static const String leadsScreenDetails = "/LeadsScreenDetails";
  static const String addLeadNote = "/AddLeadNote";


  Map<String, WidgetBuilder> routes() {
    return {
      AppRouter.homeScreen: (context) => const HomeScreen(),
      AppRouter.onboardingScreen: (context) => const OnboardingScreen(),
      AppRouter.leadsScreen: (context) => const LeadsWidget(),
     // AppRouter.addLeadNote: (context) =>  AddLeadNote(status: "",),

    };
  }
}

import 'package:flutter/material.dart';
import 'package:tracks_admin_app/screens/Home/home_view.dart';

import '../screens/onboding/onboding_screen.dart';

class AppRouter {
  static const String homeScreen = "/HomeScreen";
  static const String onboardingScreen = "/OnBoardingScreen";

  Map<String, WidgetBuilder> routes() {
    return {
      AppRouter.homeScreen: (context) => const HomeScreen(),
      AppRouter.onboardingScreen: (context) => const OnboardingScreen(),
    };
  }
}

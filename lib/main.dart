import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:tracks_admin_app/screens/splash_screen/splash_screen_view.dart';
import 'package:tracks_admin_app/utils/app_router.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  //   options: const FirebaseOptions(
  //   apiKey: "AIzaSyA2gR4iJkSH3NgmkxU4XLzELHW2dgaLNIA",
  //   appId: "1:76911324684:web:7d19acec823746bbd68829",
  //   messagingSenderId: "76911324684",
  //   projectId: "tracksrealestateegy",
  // ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'The Flutter Way',
      theme: ThemeData(
        scaffoldBackgroundColor:Colors.white,
        primarySwatch: Colors.blue,
        fontFamily: "Intel",
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          errorStyle: TextStyle(height: 0),
          border: defaultInputBorder,
          enabledBorder: defaultInputBorder,
          focusedBorder: defaultInputBorder,
          errorBorder: defaultInputBorder,
        ),
      ),
      home: const SplashScreen(),

      routes: AppRouter().routes(),
      localizationsDelegates: const [MonthYearPickerLocalizations.delegate],
    );
  }
}

const defaultInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(16)),
  borderSide: BorderSide(color: Color(0xFFDEE3F2), width: 1),
);

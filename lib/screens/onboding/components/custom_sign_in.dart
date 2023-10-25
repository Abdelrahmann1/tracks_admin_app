import 'package:flutter/material.dart';
import 'package:tracks_admin_app/screens/onboding/components/sign_in_form.dart';

Future<Object?> customSigninDialog(BuildContext context,
    {required ValueChanged onClosed}) {
  return showGeneralDialog(
      barrierDismissible: true,
      barrierLabel: "Sign up",
      context: context,
      transitionDuration: const Duration(milliseconds: 400),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        Tween<Offset> tween =
            Tween(begin: const Offset(0, -1), end: Offset.zero);
        return SlideTransition(
            position: tween.animate(
                CurvedAnimation(parent: animation, curve: Curves.easeInOut)),
            child: child);
      },
      pageBuilder: (context, _, __) => Center(
            child: Container(
              height: 600,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.95),
                  borderRadius: const BorderRadius.all(Radius.circular(40))),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                resizeToAvoidBottomInset:
                    false, // avoid overflow error when keyboard shows up
                body: SingleChildScrollView(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Column(children: [
                        const Text(
                          "Sign In",
                          style: TextStyle(fontSize: 34, fontFamily: "Poppins"),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Text(
                            "WELCOME TO TRACKS INTERNATIONAL",
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SignInForm(),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30)),
                          width: 200,
                          height: 100,
                          child: Image.asset(
                              "assets/logo/Tracks International-04.png"),
                        )
                      ]),
                      const Positioned(
                        left: 0,
                        right: 0,
                        bottom: -48,
                        child: CircleAvatar(
                          radius: 16,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.close, color: Colors.black),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )).then(onClosed);
}

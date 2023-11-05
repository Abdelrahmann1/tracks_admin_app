import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:tracks_admin_app/extentions/padding_ext.dart';
import 'package:tracks_admin_app/models/user_model.dart';
import 'package:tracks_admin_app/utils/app_colors.dart';

class TodayScreen extends StatefulWidget {
  const TodayScreen({super.key});
  @override
  State<TodayScreen> createState() => _TodayScreenState();
}
class _TodayScreenState extends State<TodayScreen> {
  String checkIn = "--/--";
  String checkOut = "--/--";
  final GlobalKey<SlideActionState> key = GlobalKey();

  void getRecord() async {
    try {
      QuerySnapshot snap = await FirebaseFirestore.instance
          .collection("Employee")
          .get();
      DocumentSnapshot snap2 = await FirebaseFirestore.instance
          .collection("Employee")
          .doc(snap.docs[0].id)
          .collection("Records")
          .doc(DateFormat("dd MMMM yyyy").format(DateTime.now()))
          .get();

      setState(() {
        checkIn = snap2['checkIn'];
        checkOut = snap2['checkOut'];
      });
    } catch (e) {
      setState(() {
        checkIn = "--/--";
        checkOut = "--/--";
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getRecord();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 30),
              alignment: Alignment.centerLeft,
              child: const Text(
                "WELCOME",
                style: TextStyle(
                    color: AppColors.shadowColorLight,
                    fontSize: 18,
                    fontWeight: FontWeight.w400
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5),
              alignment: Alignment.centerLeft,
              child: Text(
                Users.userName.split('@').first,
                style: const TextStyle(
                    color: AppColors.shadowColorLight,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 32),
              alignment: Alignment.centerLeft,
              child: const Text(
                "Today's Status",
                style: TextStyle(
                    color: AppColors.shadowColorLight,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 12, bottom: 30),
              height: 150,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: AppColors.white,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black26,
                      blurRadius: 10,
                      offset: Offset(2, 2),
                    )
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Check In ",
                        style: TextStyle(fontSize: 18, color: AppColors.green),
                      ),
                      Text(checkIn,
                          style: const TextStyle(
                              fontSize: 20,
                              color: AppColors.black54,
                              fontWeight: FontWeight.bold)),
                    ],
                  )),
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text("Check Out",
                          style: TextStyle(fontSize: 18, color: AppColors.red)),
                      Text(checkOut,
                          style: const TextStyle(
                              fontSize: 20,
                              color: AppColors.black54,
                              fontWeight: FontWeight.bold)),
                    ],
                  )),
                ],
              ),
            ),
            Container(
                alignment: Alignment.centerLeft,
                child: RichText(
                  text: TextSpan(
                      text: DateTime.now().day.toString(),
                      style: const TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                            text:
                                DateFormat(" MMMM yyyy").format(DateTime.now()),
                            style: const TextStyle(
                              color: AppColors.shadowColorDark,
                              fontSize: 20,
                            ))
                      ]),
                )),
            StreamBuilder(
                stream: Stream.periodic(const Duration(seconds: 1)),
                builder: (context, snapshot) {
                  return Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      DateFormat("hh:mm:ss a").format(DateTime.now()),
                      style: const TextStyle(
                          fontSize: 20,
                          color: AppColors.black54,
                          fontWeight: FontWeight.bold),
                    ),
                  );
                }),
            checkOut == "--/--"
                ? Container(
                    margin: const EdgeInsets.only(top: 30),
                    child: Builder(builder: (context) {
                      final GlobalKey<SlideActionState> key = GlobalKey();
                      return SlideAction(
                          text: checkIn == "--/--"
                              ? "Slide to check In"
                              : "Slide to Check Out",
                          textStyle: const TextStyle(
                              color: AppColors.black54, fontSize: 18),
                          outerColor: AppColors.white,
                          innerColor: AppColors.primaryColor,
                          key: key,
                          onSubmit: () async {
                            Timer(const Duration(seconds: 1), () {
                              key.currentState!.reset();
                            });
                            QuerySnapshot snap = await FirebaseFirestore
                                .instance
                                .collection("Employee")
                                .get();
                            DocumentSnapshot snap2 =
                                await FirebaseFirestore.instance
                                    .collection("Employee")
                                    .doc(snap.docs[0].id)
                                    .collection("Records")
                                    .doc(
                                      DateFormat("dd MMMM yyyy")
                                          .format(DateTime.now()),
                                    )
                                    .get();
                            try {
                              String checkIn = snap2['checkIn'];
                              setState(() {
                                checkOut = DateFormat('hh : mm ')
                                    .format(DateTime.now());
                              });
                              await FirebaseFirestore.instance
                                  .collection("Employee")
                                  .doc(snap.docs[0].id)
                                  .collection("Records")
                                  .doc(
                                    DateFormat("dd MMMM yyyy")
                                        .format(DateTime.now()),
                                  )
                                  .update({
                                "checkIn": checkIn,
                                "checkOut": DateFormat('hh : mm ')
                                    .format(DateTime.now())
                              });
                            } catch (e) {
                              setState(() {
                                checkIn = DateFormat('hh : mm ')
                                    .format(DateTime.now());
                              });
                              await FirebaseFirestore.instance
                                  .collection("Employee")
                                  .doc(snap.docs[0].id)
                                  .collection("Records")
                                  .doc(
                                    DateFormat("dd MMMM yyyy")
                                        .format(DateTime.now()),
                                  )
                                  .set({
                                "checkIn": DateFormat('hh : mm ')
                                    .format(DateTime.now())
                              });
                            }
                          });
                    }),
                  )
                : const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      "You Have complete This Day",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  )
          ],
        ),
      ),
    )).setPageHorizontalPadding(context);
  }
}

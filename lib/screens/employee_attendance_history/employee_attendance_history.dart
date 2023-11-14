import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:tracks_admin_app/models/user_model.dart';
import 'package:tracks_admin_app/utils/app_colors.dart';

class EmployeeAttendanceHistory extends StatefulWidget {
  const EmployeeAttendanceHistory({super.key});

  @override
  State<EmployeeAttendanceHistory> createState() =>
      _EmployeeAttendanceHistoryState();
}

class _EmployeeAttendanceHistoryState extends State<EmployeeAttendanceHistory> {
  double screenHeight = 0;
  double screenWidth = 0;
  String _month = DateFormat('MMMM').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.white,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.black54,
              weight: 900,
            ),
          ),
          title: Text("Attendance History",
              style: GoogleFonts.outfit(
                color: const Color(0xFF101213),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 38, left: 5),
                      alignment: Alignment.centerLeft,
                      child: Text(_month,
                          style: GoogleFonts.outfit(
                            color: const Color(0xFF101213),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    GestureDetector(
                      onTap: () async {
                        final month = await showMonthYearPicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2023),
                          lastDate: DateTime(2099),
                          builder: (context, child) {
                            return Theme(
                                data: Theme.of(context).copyWith(
                                    colorScheme: const ColorScheme.light(
                                        secondary: AppColors.primaryColor,
                                        primary: AppColors.primaryColor)),
                                child: child!);
                          },
                        );
                        if (month != null) {
                          setState(() {
                            _month = DateFormat("MMMM").format(month);
                          });
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: 30),
                        alignment: Alignment.centerRight,
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: AppColors.primaryColor, // Add border color
                              width: 2.0,
                            ),
                          ),
                          child: Text("Pick a Month",
                              style: GoogleFonts.outfit(
                                color: AppColors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: screenHeight / 1.3,
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection("Employee")
                        .doc(Users.id)
                        .collection("Records")
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
                      if (snapshot.hasData) {
                        final snap = snapshot.data!.docs;
                        return ListView.builder(
                            itemCount: snap.length,
                            itemBuilder: (context, index) {
                              return DateFormat("MMMM").format(
                                          snap[index]["date"].toDate()) ==
                                      _month
                                  ? Container(
                                      margin: const EdgeInsets.only(
                                          top: 12, bottom: 10),
                                      height: 120,
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                          color: AppColors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: AppColors.black26,
                                              blurRadius: 10,
                                              offset: Offset(2, 2),
                                            )
                                          ]),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                              child: Container(
                                            margin: const EdgeInsets.only(),
                                            decoration: const BoxDecoration(
                                              color: AppColors.primaryColor,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20)),
                                            ),
                                            child: Center(
                                              child: Text(
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize:
                                                          screenWidth / 20,
                                                      color: AppColors.white),
                                                  DateFormat("EE\ndd").format(
                                                      snap[index]["date"]
                                                          .toDate())),
                                            ),
                                          )),
                                          Expanded(
                                              child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text("Check In ",
                                                  style: GoogleFonts.outfit(
                                                    color: AppColors.green,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                  )),
                                              Text(snap[index]["checkIn"],
                                                  style: const TextStyle(
                                                      fontSize: 20,
                                                      color: AppColors.black54,
                                                      fontWeight:
                                                          FontWeight.bold)
                                              ),
                                            ],
                                          )),
                                          Expanded(
                                              child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text("Check Out",
                                                style: GoogleFonts.outfit(
                                                  color: AppColors.red,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,)),
                                              Text(snap[index]["checkOut"],
                                                  style: const TextStyle(
                                                      fontSize: 20,
                                                      color: AppColors.black54,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ],
                                          )),
                                        ],
                                      ))
                                  : const SizedBox();
                            });
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        )));
  }
}

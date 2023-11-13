import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tracks_admin_app/models/user_model.dart';
import 'package:tracks_admin_app/utils/app_colors.dart';

import '../employee_attendance_history/employee_attendance_history.dart';

class Profile05Widget extends StatefulWidget {
  const Profile05Widget({Key? key}) : super(key: key);

  @override
  _Profile05WidgetState createState() => _Profile05WidgetState();
}

class _Profile05WidgetState extends State<Profile05Widget>
    with TickerProviderStateMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: AppColors.white,
        appBar: AppBar(

          elevation: 0,
          title:  Text(
            "Profile",
    style: GoogleFonts.outfit(
    color: const Color(0xFF101213),
    fontSize: 24,
    fontWeight: FontWeight.bold,)

          ),
          backgroundColor: AppColors.white,
          automaticallyImplyLeading: false,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                    child: Image.asset(
                      "assets/logo/Tracks International-04.png",
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                child: Text(
                  Users.userName.split('@').first,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                child: Text(
                  Users.userName,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w400),
                ),
              ),
              const Divider(
                height: 44,
                thickness: 1,
                indent: 24,
                endIndent: 24,
              ),
              Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      // color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: AppColors.black26,
                        width: 2,
                      ),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(8, 12, 8, 12),
                      child: InkWell(
                        onTap: () {
                          Get.to(const EmployeeAttendanceHistory());
                        },
                        child: const Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                              child: Icon(
                                Icons.access_alarm_rounded,
                                color: AppColors.black26,
                                size: 24,
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                              child: Text(
                                'Attendance',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    // color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: AppColors.black26,
                      width: 2,
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 12, 8, 12),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                          child: Icon(
                            Icons.account_circle_outlined,
                            color: AppColors.black26,
                            size: 24,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                          child: Text(
                            'Edit Profile',
                            // style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      // color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: AppColors.black26,
                        width: 2,
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(8, 12, 8, 12),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                            child: Icon(
                              Icons.settings_outlined,
                              color: AppColors.black26,
                              size: 24,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                            child: Text(
                              'Account Settings',
                              // style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
              Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                  child: MaterialButton(
                      color: AppColors.primaryColor,
                      textColor: AppColors.white,
                      onPressed: () async {
                        try {
                          await FirebaseAuth.instance.signOut();
                          final sharedPreferences =
                              await SharedPreferences.getInstance();
                          sharedPreferences.remove("uidToken");
                          SystemNavigator.pop();
                          print('User logged out');
                        } catch (e) {
                          print('Error signing out: $e');
                        }
                      },
                      child: const Text(
                        'Log Out',
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}

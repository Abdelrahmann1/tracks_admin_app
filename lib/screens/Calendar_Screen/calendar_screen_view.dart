import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pmvvm/mvvm_builder.widget.dart';
import 'package:pmvvm/views/hook.view.dart';
import 'package:tracks_admin_app/screens/Calendar_Screen/calendar_screen_view_model.dart';
import 'package:tracks_admin_app/screens/Home/home_view_model.dart';
import 'package:tracks_admin_app/utils/app_colors.dart';
import '../../Admin/dashboard.dart';
import '../../utils/app_router.dart';
import '../Leads/LeadsListView.dart';

class CalenderScreen extends StatelessWidget {
  const CalenderScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MVVM(
      view: (_, __) => const CalenderView(),
      viewModel: CalenderScreenViewModel(),
    );
  }
}

class CalenderView extends HookView<HomeViewModel> {
  const CalenderView({Key? key, reactive = true});

  @override
  Widget render(context, viewModel) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              title: Text('My Stats',
                  style: GoogleFonts.outfit(
                    color: const Color(0xFF101213),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  )),
              backgroundColor: AppColors.white,
              automaticallyImplyLeading: false,
            ),
            backgroundColor: AppColors.white,
            body: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0.00, 0.00),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 16, 0, 0),
                            child: Wrap(
                              spacing: 16,
                              runSpacing: 16,
                              alignment: WrapAlignment.start,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              direction: Axis.horizontal,
                              runAlignment: WrapAlignment.start,
                              verticalDirection: VerticalDirection.down,
                              clipBehavior: Clip.none,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.to(const LeadsWidget());
                                    // AppRouter.leadsScreen
                                  },
                                  child: Container(
                                    width:
                                    MediaQuery.sizeOf(context).width * 0.4,
                                    height: 160,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFF1F4F8),
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    child: Padding(
                                      padding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          12, 12, 12, 12),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.person,
                                            color: Color(0xFF101213),
                                            size: 44,
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(0, 12, 0, 4),
                                            child: Text(
                                              'LEADS',
                                              textAlign: TextAlign.center,
                                              style:
                                              GoogleFonts.plusJakartaSans(
                                                color: const Color(0xFF101213),
                                                fontSize: 36,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            'Customers',
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.plusJakartaSans(
                                              color: const Color(0xFF57636C),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, AppRouter.unitesScreen);
                                  },
                                  child: Container(
                                    width:
                                    MediaQuery.sizeOf(context).width * 0.4,
                                    height: 160,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFF1F4F8),
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    child: Padding(
                                      padding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          12, 12, 12, 12),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.maps_home_work_rounded,
                                            color: Color(0xFF101213),
                                            size: 44,
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(0, 12, 0, 4),
                                            child: Text(
                                              'UNITS',
                                              textAlign: TextAlign.center,
                                              style:
                                              GoogleFonts.plusJakartaSans(
                                                color: const Color(0xFF101213),
                                                fontSize: 36,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            'All Units',
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.plusJakartaSans(
                                              color: const Color(0xFF57636C),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.00, 0.00),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 16, 0, 0),
                            child: Wrap(
                              spacing: 16,
                              runSpacing: 16,
                              alignment: WrapAlignment.start,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              direction: Axis.horizontal,
                              runAlignment: WrapAlignment.start,
                              verticalDirection: VerticalDirection.down,
                              clipBehavior: Clip.none,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.to(DashBoard());
                                    // AppRouter.leadsScreen
                                  },
                                  child: Container(
                                    width:
                                    MediaQuery.sizeOf(context).width * 0.4,
                                    height: 160,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFF1F4F8),
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    child: Padding(
                                      padding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          12, 12, 12, 12),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.person,
                                            color: Color(0xFF101213),
                                            size: 44,
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(0, 12, 0, 4),
                                            child: Text(
                                              'ADMIN',
                                              textAlign: TextAlign.center,
                                              style:
                                              GoogleFonts.plusJakartaSans(
                                                color: const Color(0xFF101213),
                                                fontSize: 36,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            'View',
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.plusJakartaSans(
                                              color: const Color(0xFF57636C),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
}

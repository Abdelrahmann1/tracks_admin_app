import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class LeadsDetailsWidget extends StatefulWidget {
  const LeadsDetailsWidget({Key? key}) : super(key: key);

  @override
  _LeadsDetailsWidgetState createState() => _LeadsDetailsWidgetState();
}

class _LeadsDetailsWidgetState extends State<LeadsDetailsWidget> {

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: MediaQuery.sizeOf(context).width <= 991.0
          ? AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: IconButton(

          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Color(0xFF15161E),
            size: 30,
          ),
          onPressed: () async {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Lead Details',
          style: GoogleFonts.plusJakartaSans(

          color: const Color(0xFF15161E),
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      )
          : null,
      body: SafeArea(
        top: true,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Expanded(
              child: Align(
                alignment: const AlignmentDirectional(0.00, -1.00),
                child: Container(
                  width: double.infinity,
                  constraints: const BoxConstraints(
                    maxWidth: 1170,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: double.infinity,
                          constraints: const BoxConstraints(
                            maxWidth: 1170,
                          ),
                          decoration: const BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16, 0, 0, 0),
                                child: Text(
                                  'Lead Details',
                                  style: GoogleFonts.plusJakartaSans(

                                  color: const Color(0xFF15161E),
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16, 4, 0, 0),
                                child: Text(
                                  'Below are the details of your lead.',
                                  style: GoogleFonts.plusJakartaSans(
                                  color: const Color(0xFF606A85),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.00, -1.00),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                            child: Container(
                              width: double.infinity,
                              constraints: const BoxConstraints(
                                maxWidth: 1170,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: const Color(0xFFE5E7EB),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 8,
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          16, 16, 0, 16),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Info',
                                            style: GoogleFonts.outfit(

                                            color: const Color(0xFF15161E),
                                              fontSize: 24,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(0, 8, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                Text(
                                                  'Name',
                                                  style: GoogleFonts.plusJakartaSans(

                                                  color:
                                                    const Color(0xFF606A85),
                                                    fontSize: 14,
                                                    fontWeight:
                                                    FontWeight.w500,
                                                  ),
                                                ),
                                                Text(
                                                  'Mostafa Ashraf',
                                                  style: GoogleFonts.plusJakartaSans(

                                                  color:
                                                    const Color(0xFF15161E),
                                                    fontSize: 14,
                                                    fontWeight:
                                                    FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                Text(
                                                  'Date',
                                                  style: GoogleFonts.plusJakartaSans(

                                                  color:
                                                    const Color(0xFF606A85),
                                                    fontSize: 14,
                                                    fontWeight:
                                                    FontWeight.normal,
                                                  ),
                                                ),
                                                Text('Fri, Jun 23 - 4:30pm',
                                                  style: GoogleFonts.plusJakartaSans(
                                                  color:
                                                  const Color(0xFF15161E),
                                                    fontSize: 14,
                                                    fontWeight:
                                                    FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(0, 8, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                Text(
                                                  'Min price',
                                                  style:GoogleFonts.plusJakartaSans(

                                                  color:
                                                    const Color(0xFF606A85),
                                                    fontSize: 14,
                                                    fontWeight:
                                                    FontWeight.normal,
                                                  ),
                                                ),
                                                Text(
                                                  '\$500.00',
                                                  style: GoogleFonts.plusJakartaSans(

                                                  color:
                                                    const Color(0xFF15161E),
                                                    fontSize: 14,
                                                    fontWeight:
                                                    FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(0, 8, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                Text(
                                                  'Status',
                                                  style: GoogleFonts.plusJakartaSans(

                                                  color:
                                                    const Color(0xFF606A85),
                                                    fontSize: 14,
                                                    fontWeight:
                                                    FontWeight.normal,
                                                  ),
                                                ),
                                                Text(
                                                  'Completed',
                                                  style: GoogleFonts.plusJakartaSans(

                                                  color:
                                                    const Color(0xFF15161E),
                                                    fontSize: 14,
                                                    fontWeight:
                                                    FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(padding: const EdgeInsetsDirectional
                                                .fromSTEB(0, 8, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                Text(
                                                  'Area',
                                                  style:GoogleFonts.plusJakartaSans(

                                                  color:
                                                    const Color(0xFF606A85),
                                                    fontSize: 14,
                                                    fontWeight:
                                                    FontWeight.normal,
                                                  ),
                                                ),
                                                Text(
                                                  'New cairo',
                                                  style:GoogleFonts.plusJakartaSans(

                                                  color:
                                                    const Color(0xFF15161E),
                                                    fontSize: 14,
                                                    fontWeight:
                                                    FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const Padding(
                                            padding: EdgeInsetsDirectional
                                                .fromSTEB(0, 16, 0, 16),
                                            child: Divider(
                                              thickness: 2,
                                              color: Color(0xFFE5E7EB),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(0, 0, 0, 12),
                                            child: Text(
                                              'Contact',
                                              style:
                                              GoogleFonts.plusJakartaSans(

                                              color:
                                                const Color(0xFF15161E),
                                                fontSize: 16,
                                                fontWeight:
                                                FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(0, 8, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                Text(
                                                  'phone number',
                                                  style: GoogleFonts.plusJakartaSans(

                                                  color:
                                                    const Color(0xFF606A85),
                                                    fontSize: 14,
                                                    fontWeight:
                                                    FontWeight.normal,
                                                  ),
                                                ),
                                                Text(
                                                  '01282160015',
                                                  style: GoogleFonts.plusJakartaSans(

                                                  color:
                                                    const Color(0xFF15161E),
                                                    fontSize: 14,
                                                    fontWeight:
                                                    FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(0, 8, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                Text(
                                                  'address',
                                                  style: GoogleFonts.plusJakartaSans(

                                                  color:
                                                    const Color(0xFF606A85),
                                                    fontSize: 14,
                                                    fontWeight:
                                                    FontWeight.normal,
                                                  ),
                                                ),
                                                Text(
                                                  'Hay el awel, Nasr city',
                                                  style: GoogleFonts.plusJakartaSans(
                                                  color:
                                                    const Color(0xFF15161E),
                                                    fontSize: 14,
                                                    fontWeight:
                                                    FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(0, 8, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  'Max price',
                                                  style: GoogleFonts.plusJakartaSans(

                                                  color:
                                                    const Color(0xFF606A85),
                                                    fontSize: 16,
                                                    fontWeight:
                                                    FontWeight.w500,
                                                  ),
                                                ),
                                                Text(
                                                  '\$500.00',
                                                  style: GoogleFonts.outfit(

                                                  color:
                                                    const Color(0xFF15161E),
                                                    fontSize: 22,
                                                    fontWeight:
                                                    FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const Padding(
                                            padding: EdgeInsetsDirectional
                                                .fromSTEB(0, 16, 0, 16),
                                            child: Divider(
                                              thickness: 2,
                                              color: Color(0xFFE5E7EB),
                                            ),
                                          ),
                                          Text(
                                            'Notes',
                                            style: GoogleFonts.plusJakartaSans(

                                            color: const Color(0xFF606A85),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(0, 8, 0, 0),
                                            child: Text(
                                              'Transaction for monthly subscription.',
                                              style:
                                              GoogleFonts.plusJakartaSans(

                                                color:
                                                const Color(0xFF15161E),
                                                fontSize: 16,
                                                fontWeight:
                                                FontWeight.w600,
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
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

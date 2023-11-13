import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tracks_admin_app/utils/app_colors.dart';
import 'add_lead_note.dart';
class LeadsDetailsWidget extends StatefulWidget {
  final String name;
  final String phone;
  final String minPrice;
  final String maxPrice;
  final String area;
  final String date;
  final String status;
  final String address;
  final String notes;
  final String id;

  const LeadsDetailsWidget(
      {Key? key,
      required this.name,
      required this.phone,
      required this.minPrice,
      required this.maxPrice,
      required this.area,
      required this.date,
      required this.status,
      required this.address,
      required this.notes,
      required this.id})
      : super(key: key);

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
      appBar: AppBar(
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
        centerTitle: false,
        elevation: 0,
      ),
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
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
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
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
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
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
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: AlignmentDirectional.bottomStart,
                  child: Text(
                    'Info',
                    style: GoogleFonts.outfit(
                      color: const Color(0xFF15161E),
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Name',
                        style: GoogleFonts.plusJakartaSans(
                          color: const Color(0xFF606A85),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        widget.name,
                        style: GoogleFonts.plusJakartaSans(
                          color: const Color(0xFF15161E),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Date',
                        style: GoogleFonts.plusJakartaSans(
                          color: const Color(0xFF606A85),
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        widget.date,
                        style: GoogleFonts.plusJakartaSans(
                          color: const Color(0xFF15161E),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Min price',
                        style: GoogleFonts.plusJakartaSans(
                          color: const Color(0xFF606A85),
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        '${widget.maxPrice} LE',
                        style: GoogleFonts.plusJakartaSans(
                          color: const Color(0xFF15161E),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Status',
                        style: GoogleFonts.plusJakartaSans(
                          color: const Color(0xFF606A85),
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        widget.status,
                        style: GoogleFonts.plusJakartaSans(
                          color: const Color(0xFF15161E),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Area',
                        style: GoogleFonts.plusJakartaSans(
                          color: const Color(0xFF606A85),
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        widget.area,
                        style: GoogleFonts.plusJakartaSans(
                          color: const Color(0xFF15161E),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 16),
                  child: Divider(
                    thickness: 2,
                    color: Color(0xFFE5E7EB),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional.bottomStart,
                  child: Text(
                    'Contact',
                    style: GoogleFonts.plusJakartaSans(
                      color: const Color(0xFF15161E),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'phone number',
                        style: GoogleFonts.plusJakartaSans(
                          color: const Color(0xFF606A85),
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        widget.phone,
                        style: GoogleFonts.plusJakartaSans(
                          color: const Color(0xFF15161E),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'address',
                        style: GoogleFonts.plusJakartaSans(
                          color: const Color(0xFF606A85),
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        widget.address,
                        style: GoogleFonts.plusJakartaSans(
                          color: const Color(0xFF15161E),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Max price',
                        style: GoogleFonts.plusJakartaSans(
                          color: const Color(0xFF606A85),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '${widget.maxPrice} LE',
                        style: GoogleFonts.outfit(
                          color: const Color(0xFF15161E),
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 16),
                  child: Divider(
                    thickness: 2,
                    color: Color(0xFFE5E7EB),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddLeadNote(
                                status: widget.status,
                                id: widget.id,
                              ),
                            ));
                        //Navigator.pushNamed(context, AppRouter.addLeadNote);
                      },
                      color: AppColors.primaryColor,
                      child: const Text(
                        "Add Note",
                        style: TextStyle(color: AppColors.white),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
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
                  padding: const EdgeInsetsDirectional.fromSTEB(10, 8, 0, 0),
                  child: Text(
                    widget.notes,
                    style: GoogleFonts.plusJakartaSans(
                      color: const Color(0xFF15161E),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                    width: 400,
                    height: 200,
                    child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('Leads')
                          .doc(widget.id)
                          .collection('FollowUp')
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snap) {
                        if (snap.connectionState == ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        }
                        if (snap.hasError) {
                          return Text('Error: ${snap.error}');
                        }
                        if (!snap.hasData || snap.data!.docs.isEmpty) {
                          return const Text('No follow-ups found.');
                        }
                        return ListView.builder(
                          itemCount: snap.data!.docs.length,
                          itemBuilder: (context, index) {
                            DocumentSnapshot document = snap.data!.docs[index];
                            Map<String, dynamic> data =
                                document.data() as Map<String, dynamic>;
                            return StreamBuilder<DocumentSnapshot>(
                              stream: FirebaseFirestore.instance
                                  .collection('Actions')
                                  .doc(document["actionID"])
                                  .snapshots(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                                var docData = snapshot.data!;
                                if (snapshot.connectionState == ConnectionState.waiting) {
                                  return const CircularProgressIndicator();
                                }

                                if (snapshot.hasError) {
                                  return Text('Error: ${snapshot.error}');
                                }

                                if (!snapshot.hasData) {
                                  return const Text('No follow-ups found.');
                                }

                                return
                                    Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
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
                                    child: Expanded(
                                      flex: 8,
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            16, 16, 0, 16),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Lead Details',
                                              style: GoogleFonts.outfit(
                                                color: const Color(0xFF15161E),
                                                fontSize: 24,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0, 8, 10, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Name : ',
                                                    style: GoogleFonts
                                                        .plusJakartaSans(
                                                      color: const Color(0xFF606A85),
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                  Text(
                                                    docData["name"],
                                                    style: GoogleFonts.plusJakartaSans(
                                                      color: const Color(0xFF15161E),
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
                                                  .fromSTEB(0, 8, 10, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Status Of Lead : ',
                                                    style: GoogleFonts
                                                        .plusJakartaSans(
                                                      color: const Color(0xFF606A85),
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                                  ),
                                                  Text(
                                                    docData["status"],
                                                    style: GoogleFonts
                                                        .plusJakartaSans(
                                                      color: const Color(0xFF15161E),
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
                                                  .fromSTEB(0, 8, 10, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Type Of Lead  : ',
                                                    style: GoogleFonts
                                                        .plusJakartaSans(
                                                      color: const Color(0xFF606A85),
                                                      fontSize: 14,
                                                      fontWeight:
                                                      FontWeight.normal,
                                                    ),
                                                  ),
                                                  Text(
                                                    docData["description"],
                                                    style: GoogleFonts
                                                        .plusJakartaSans(
                                                      color: const Color(0xFF15161E),
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
                                                  .fromSTEB(0, 8, 10, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Date  : ',
                                                    style: GoogleFonts
                                                        .plusJakartaSans(
                                                      color: const Color(0xFF606A85),
                                                      fontSize: 14,
                                                      fontWeight:
                                                      FontWeight.normal,
                                                    ),
                                                  ),
                                                  Text(
                                                    docData["startDate"],
                                                    style: GoogleFonts
                                                        .plusJakartaSans(
                                                      color: const Color(0xFF15161E),
                                                      fontSize: 14,
                                                      fontWeight:
                                                      FontWeight.w500,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

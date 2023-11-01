import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tracks_admin_app/screens/Leads/LeadsDetail.dart';

import '../Units/app_styles.dart';

class LeadsWidget extends StatefulWidget {
  const LeadsWidget({Key? key}) : super(key: key);

  @override
  _LeadsWidgetState createState() => _LeadsWidgetState();
}

class _LeadsWidgetState extends State<LeadsWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  List<String> categories = [
    "New cairo",
    "New capital",
    "Commercial",
    "Ma'adi",
    "Other",
  ];
  int current = 0;
  String filter = "";
  final CollectionReference leadsData =
      FirebaseFirestore.instance.collection("Leads");

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
            color: Color(0xFF606A85),
            size: 30,
          ),
          onPressed: () async {
            Navigator.pop(context);
          },
        ),
        actions: const [],
        title: Text('Recent Leads',
          style: GoogleFonts.outfit(
            color: const Color(0xFF15161E),
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(24, 4, 0, 0),
              child: Text(
                'Below are your leads',
                textAlign: TextAlign.start,
                style: GoogleFonts.outfit(
                  color: const Color(0xFF606A85),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              height: 34,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        current = index;
                        filter = categories[index];
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                        left: index == 0 ? kPadding20 : 12,
                        right:
                            index == categories.length - 1 ? kPadding20 : 0,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: kPadding16,
                      ),
                      height: 34,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 0,
                            offset: const Offset(0, 18),
                            blurRadius: 18,
                            color: current == index
                                ? kBlue.withOpacity(0.1)
                                : kBlue.withOpacity(0),
                          )
                        ],
                        gradient: current == index
                            ? kLinearGradientBlue
                            : kLinearGradientWhite,
                        borderRadius: BorderRadius.circular(
                          kBorderRadius10,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          categories[index],
                          style: kRalewayMedium.copyWith(
                            color: current == index ? kWhite : kGrey85,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: FutureBuilder(
                  future: leadsData.get(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.data!.docs.isNotEmpty) {
                        return ListView.builder(
                          itemCount:  snapshot.data!.docs.length,
                            itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 12, 0, 24),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                                  child: Container(
                                    width: double.infinity,
                                    constraints: const BoxConstraints(
                                      maxWidth: 570,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: const Color(0xFFE5E7EB),
                                        width: 2,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional
                                          .fromSTEB(16, 12, 16, 12),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(0, 0, 12, 0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                              0, 4, 0, 0),
                                                  child: Text(
                                                    snapshot.data!
                                                        .docs[index]["name"]
                                                        .toString(),
                                                    style: GoogleFonts.outfit(
                                                      color: const Color(
                                                          0xFF606A85), fontSize: 14,
                                                      fontWeight:FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                                RichText(
                                                  textScaleFactor:
                                                      MediaQuery.of(context)
                                                          .textScaleFactor,
                                                  text: TextSpan(
                                                    children:  [
                                                      const TextSpan(
                                                        text: 'Phone #: ',
                                                        style: TextStyle(),
                                                      ),
                                                      TextSpan(
                                                        text: snapshot.data!
                                                            .docs[index]["phoneNumber"]
                                                            .toString(),
                                                        style: const TextStyle(
                                                          color: Color(
                                                              0xFF6F61EF),
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      )
                                                    ],
                                                    style: GoogleFonts
                                                        .plusJakartaSans(
                                                      color: const Color(
                                                          0xFF15161E),
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          0, 4, 0, 0),
                                                  child: Text(
                                                      snapshot.data!
                                                          .docs[index]["date"]
                                                          .toString(),
                                                    style: GoogleFonts.outfit(
                                                      color: const Color(
                                                          0xFF606A85),
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) => LeadsDetailsWidget(
                                                            name: snapshot.data!.docs[index]["name"],
                                                            phone: snapshot.data!.docs[index]["phoneNumber"],
                                                            minPrice: snapshot.data!.docs[index]["priceMin"],
                                                            maxPrice: snapshot.data!.docs[index]["priceMax"],
                                                            area: snapshot.data!.docs[index]["area"],
                                                            date: snapshot.data!.docs[index]["date"],
                                                            status: snapshot.data!.docs[index]["status"],
                                                            notes: snapshot.data!.docs[index]["notes"],
                                                            id: snapshot.data!.docs[index].id,
                                                            address: snapshot.data!.docs[index]["address"]),
                                                      ),
                                                    );

                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(
                                                            0, 12, 0, 0),
                                                    child: Container(
                                                      height: 32,
                                                      decoration:
                                                          BoxDecoration(
                                                        color: const Color(
                                                            0xFFF1F4F8),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                        border: Border.all(
                                                          color: const Color(
                                                              0xFFE5E7EB),
                                                          width: 2,
                                                        ),
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                0.00, 0.00),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                  7, 0, 7, 0),
                                                          child: Text(
                                                            'Follow ups',
                                                            style: GoogleFonts
                                                                .outfit(
                                                              color: const Color(
                                                                  0xFF606A85),
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        0, 0, 0, 12),
                                                child: Text(
                                                    snapshot.data!
                                                        .docs[index]["area"]
                                                        .toString(),
                                                  textAlign: TextAlign.end,
                                                  style: GoogleFonts.outfit(
                                                    color: const Color(
                                                        0xFF15161E),
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        0, 12, 0, 0),
                                                child: Container(
                                                  height: 32,
                                                  decoration: BoxDecoration(
                                                    color: const Color(
                                                        0x4D9489F5),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                    border: Border.all(
                                                      color: const Color(
                                                          0xFF6F61EF),
                                                      width: 2,
                                                    ),
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.00, 0.00),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                              12, 0, 12, 0),
                                                      child: Text(
                                                        'Fresh lead',
                                                        style: GoogleFonts
                                                            .plusJakartaSans(
                                                          color: const Color(
                                                              0xFF6F61EF),
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        });
                      } else {
                        return const Center(child: Text("No data"));
                      }
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  }),
              // StreamBuilder<QuerySnapshot>(
              //   stream: filter == ""
              //       ?FirebaseFirestore.instance.collection("Leads").snapshots()
              //       :FirebaseFirestore.instance.collection("Leads").where("area",isEqualTo: filter).snapshots(),
              //   builder:(BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              //     if (snapshot.hasError) return Text('Error: ${snapshot.error}');
              //     switch (snapshot.connectionState) {
              //       case ConnectionState.waiting:
              //         return const Center(child: CircularProgressIndicator());
              //       default:
              //         return ListView.builder(
              //             itemCount: snapshot.data!.size,
              //             itemBuilder: (context, int index) {
              //               return Padding(
              //                 padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 24),
              //                 child: Column(
              //                   mainAxisSize: MainAxisSize.max,
              //                   children: [
              //                     Padding(
              //                       padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
              //                       child: Container(
              //                         width: double.infinity,
              //                         constraints: const BoxConstraints(
              //                           maxWidth: 570,
              //                         ),
              //                         decoration: BoxDecoration(
              //                           color: Colors.white,
              //                           borderRadius: BorderRadius.circular(8),
              //                           border: Border.all(
              //                             color: const Color(0xFFE5E7EB),
              //                             width: 2,
              //                           ),
              //                         ),
              //                         child: Padding(
              //                           padding:
              //                           const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 12),
              //                           child: Row(
              //                             mainAxisSize: MainAxisSize.max,
              //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                             children: [
              //                               Padding(
              //                                 padding: const EdgeInsetsDirectional.fromSTEB(
              //                                     0, 0, 12, 0),
              //                                 child: Column(
              //                                   mainAxisSize: MainAxisSize.max,
              //                                   mainAxisAlignment: MainAxisAlignment.center,
              //                                   crossAxisAlignment:
              //                                   CrossAxisAlignment.start,
              //                                   children: [
              //                                     Padding(
              //                                       padding: const EdgeInsetsDirectional.fromSTEB(
              //                                           0, 4, 0, 0),
              //                                       child: Text(
              //                                         'Mostafa Ashraf',
              //                                         style: GoogleFonts.outfit(
              //                                           color: const Color(0xFF606A85),
              //                                           fontSize: 14,
              //                                           fontWeight: FontWeight.w500,
              //                                         ),
              //                                       ),
              //                                     ),
              //
              //                                     RichText(
              //                                       textScaleFactor: MediaQuery.of(context)
              //                                           .textScaleFactor,
              //                                       text: TextSpan(
              //                                         children: const [
              //                                           TextSpan(
              //                                             text: 'Phone #: ',
              //                                             style: TextStyle(),
              //                                           ),
              //                                           TextSpan(
              //                                             text: '01282160015',
              //                                             style: TextStyle(
              //                                               color: Color(0xFF6F61EF),
              //                                               fontWeight: FontWeight.bold,
              //                                             ),
              //                                           )
              //                                         ],
              //                                         style: GoogleFonts.plusJakartaSans(
              //                                           color: const Color(0xFF15161E),
              //                                           fontSize: 16,
              //                                           fontWeight: FontWeight.w600,
              //                                         ),
              //                                       ),
              //                                     ),
              //                                     Padding(
              //                                       padding: const EdgeInsetsDirectional.fromSTEB(
              //                                           0, 4, 0, 0),
              //                                       child: Text(
              //                                         '30/10/23  22:41',
              //                                         style: GoogleFonts.outfit(
              //                                           color: const Color(0xFF606A85),
              //                                           fontSize: 14,
              //                                           fontWeight: FontWeight.w500,
              //                                         ),
              //                                       ),
              //                                     ),
              //                                     InkWell(
              //                                       onTap: (){
              //
              //                                       },
              //                                       child: Padding(
              //                                         padding: const EdgeInsetsDirectional.fromSTEB(
              //                                             0, 12, 0, 0),
              //                                         child: Container(
              //                                           height: 32,
              //                                           decoration: BoxDecoration(
              //                                             color: const Color(0xFFF1F4F8),
              //                                             borderRadius:
              //                                             BorderRadius.circular(12),
              //                                             border: Border.all(
              //                                               color: const Color(0xFFE5E7EB),
              //                                               width: 2,
              //                                             ),
              //                                           ),
              //                                           child: Align(
              //                                             alignment: const AlignmentDirectional(
              //                                                 0.00, 0.00),
              //                                             child: Padding(
              //                                               padding: const EdgeInsetsDirectional
              //                                                   .fromSTEB(7, 0, 7, 0),
              //                                               child: Text(
              //                                                 'Follow ups',
              //                                                 style:
              //                                                 GoogleFonts.outfit(
              //                                                   color:
              //                                                   const Color(0xFF606A85),
              //                                                   fontSize: 14,
              //                                                   fontWeight:
              //                                                   FontWeight.w500,
              //                                                 ),
              //                                               ),
              //                                             ),
              //                                           ),
              //                                         ),
              //                                       ),),
              //                                   ],
              //                                 ),
              //                               ),
              //                               Column(
              //                                 mainAxisSize: MainAxisSize.max,
              //                                 crossAxisAlignment: CrossAxisAlignment.end,
              //                                 children: [
              //                                   Padding(
              //                                     padding: const EdgeInsetsDirectional.fromSTEB(
              //                                         0, 0, 0, 12),
              //                                     child: Text(
              //                                       'New cairo',
              //                                       textAlign: TextAlign.end,
              //                                       style: GoogleFonts.outfit(
              //                                         color: const Color(0xFF15161E),
              //                                         fontSize: 15,
              //                                         fontWeight: FontWeight.bold,
              //                                       ),
              //                                     ),
              //                                   ),
              //                                   Padding(
              //                                     padding: const EdgeInsetsDirectional.fromSTEB(
              //                                         0, 12, 0, 0),
              //                                     child: Container(
              //                                       height: 32,
              //                                       decoration: BoxDecoration(
              //                                         color: const Color(0x4D9489F5),
              //                                         borderRadius:
              //                                         BorderRadius.circular(12),
              //                                         border: Border.all(
              //                                           color: const Color(0xFF6F61EF),
              //                                           width: 2,
              //                                         ),
              //                                       ),
              //                                       child: Align(
              //                                         alignment:
              //                                         const AlignmentDirectional(0.00, 0.00),
              //                                         child: Padding(
              //                                           padding:
              //                                           const EdgeInsetsDirectional.fromSTEB(
              //                                               12, 0, 12, 0),
              //                                           child: Text(
              //                                             'Fresh lead',
              //                                             style:GoogleFonts.plusJakartaSans(
              //                                               color: const Color(0xFF6F61EF),
              //                                               fontSize: 14,
              //                                               fontWeight: FontWeight.w500,
              //                                             ),
              //                                           ),
              //                                         ),
              //                                       ),
              //                                     ),
              //                                   ),
              //                                 ],
              //                               ),
              //                             ],
              //                           ),
              //                         ),
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //               );
              //             });
              //     }
              //   },
              // )),
            )
          ],
        ),
      ),
    );
  }
}

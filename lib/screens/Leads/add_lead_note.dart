import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tracks_admin_app/extentions/padding_ext.dart';
import 'package:tracks_admin_app/utils/app_colors.dart';
import '../../controller/puplic.dart';
class AddLeadNote extends StatefulWidget {
  final String status;
  final String id;
  AddLeadNote({super.key, required this.status, required this.id});

  @override
  State<AddLeadNote> createState() => _AddLeadNoteState();
}
class _AddLeadNoteState extends State<AddLeadNote> {
  TextEditingController addDescController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  PublicController publicController = Get.put((PublicController()));
  String dropdownvalue = 'New';
  var items = [
    'New',
    'Contacted',
    'Unqualified',
    'Interested',
    'Negotiation',
    'Trash',
    'Done',
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:
        Scaffold(
            key: _formKey,
            body: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                  child: Text(
                    'Submit a Note',
                    style: GoogleFonts.outfit(
                      color: const Color(0xFF15161E),
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: addDescController,
                  autofocus: true,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Add Description',
                    labelStyle: GoogleFonts.outfit(
                      color: const Color(0xFF606A85),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    hintStyle: GoogleFonts.outfit(
                      color: const Color(0xFF606A85),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xFFE5E7EB),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xFF6F61EF),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xFFFF5963),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xFFFF5963),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    contentPadding:
                        const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 12),
                  ),
                  style: GoogleFonts.plusJakartaSans(
                    color: const Color(0xFF15161E),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  cursorColor: const Color(0xFF6F61EF),
                  // validator: _model.textController1Validator.asValidator(context),
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Change State',
                      style: GoogleFonts.outfit(
                        color: const Color(0xFF15161E),
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      height: 70,
                      width: 150,
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: DropdownButtonFormField(
                        // Initial Value
                        value: dropdownvalue,
                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down),
                        // Array list of items
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  child: MaterialButton(
                    onPressed: () async {
                      final description = addDescController.text;
                      final endDate = '';
                      final location = '';
                      final startDate = DateTime.now().toString();
                      final pID = widget.id;
                      final status = dropdownvalue;
                      final type = "FollowUp";
                      final userID = publicController.uid;
                      if (description.isNotEmpty) {
                        final collectionRef =
                            FirebaseFirestore.instance.collection('Actions');
                        try {
                          var res = await collectionRef.add({
                            'name': "FollowUp",
                            'description': description,
                            'endDate': endDate,
                            'location': location,
                            'startDate': startDate,
                            'pID': pID,
                            'status': status,
                            'type': type,
                            'userID': userID,
                          });
                          await FirebaseFirestore.instance
                              .collection("Leads")
                              .doc(widget.id)
                              .collection("FollowUp")
                              .doc(res.id)
                              .set({"actionID": res.id});
                          Navigator.pop(context);
                        } catch (e) {
                          print('Error adding data to Firestore: $e');
                        }
                      }
                    },
                    color: const Color(0xFF6F61EF),
                    textColor: AppColors.white,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.receipt_long,
                          size: 15,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text('Submit Note'),
                      ],
                    ),
                  ),
                )
              ],
            ).setPageHorizontalPadding(context)));
  }
}

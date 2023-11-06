import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tracks_admin_app/extentions/padding_ext.dart';
import 'package:tracks_admin_app/utils/app_colors.dart';

import 'LeadsListView.dart';

class AddLead extends StatefulWidget {
  const AddLead({super.key});

  @override
  State<AddLead> createState() => _AddLeadState();
}

class _AddLeadState extends State<AddLead> {

  TextEditingController addNameController = TextEditingController();
  TextEditingController addAddressController = TextEditingController();

  TextEditingController addAreaController = TextEditingController();
  TextEditingController addNoteController = TextEditingController();
  TextEditingController addPhoneNumberController = TextEditingController();
  TextEditingController addPriceMaxController = TextEditingController();
  TextEditingController addPriceMinController = TextEditingController();
  Future<void> uploadDataToFirestore() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    String address = addAddressController.text;
    String name = addNameController.text;
    String area = addAreaController.text;
    String date = DateTime.now().toString();
    String note = addNoteController.text;
    String phoneNumber = addPhoneNumberController.text;
    String priceMax = addPriceMaxController.text;
    String priceMin = addPriceMinController.text;
    Map<String, dynamic> data = {
      "address": address,
      'name': name,
      'area': area,
      'date': date,
      'note': note,
      'phoneNumber': phoneNumber,
      'priceMax': priceMax,
      'priceMin': priceMin,
      'status': "New",
    };

    try {
      await firestore.collection('Leads').add(data);
      Get.to(const LeadsWidget());
      print('Data uploaded to Firestore');
    } catch (e) {
      print('Error uploading data to Firestore: $e');
    }
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        key: _formKey,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  'Add Lead',
                  style: GoogleFonts.outfit(
                    color: const Color(0xFF15161E),
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: addNameController,
                autofocus: true,
                decoration: InputDecoration(
                  labelText: 'Name',
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
                height: 10,
              ),
              TextFormField(
                controller: addAddressController,
                autofocus: true,
                decoration: InputDecoration(
                  labelText: 'Address',
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
                height: 10,
              ),
              TextFormField(
                controller: addAreaController,
                autofocus: true,
                decoration: InputDecoration(
                  labelText: 'Area',
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
                height: 10,
              ),
              TextFormField(
                controller: addNoteController,
                autofocus: true,
                decoration: InputDecoration(
                  labelText: 'Note',
                  labelStyle: GoogleFonts.outfit(
                      color: const Color(0xFF606A85),
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
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
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: addPhoneNumberController,
                autofocus: true,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
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
                height: 10,
              ),
              TextFormField(
                controller: addPriceMaxController,
                keyboardType: TextInputType.number,

                autofocus: true,
                decoration: InputDecoration(
                  labelText: 'Price Max',
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
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: addPriceMinController,
                autofocus: true,
                decoration: InputDecoration(
                  labelText: 'Price min',
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
                height: 10,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                child: MaterialButton(
                  onPressed: () async {
                    await uploadDataToFirestore();
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
                      Text('Submit Lead'),
                    ],
                  ),
                ),
              )
            ],
          ).setPageHorizontalPadding(context),
        ));
  }
}

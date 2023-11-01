import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tracks_admin_app/extentions/padding_ext.dart';
import 'package:tracks_admin_app/utils/app_colors.dart';

class AddLeadNote extends StatefulWidget {
  final String status;
  final String id;
  AddLeadNote({super.key,required this.status,required this.id});

  @override
  State<AddLeadNote> createState() => _AddLeadNoteState();
}

class _AddLeadNoteState extends State<AddLeadNote> {
  TextEditingController addNoteController = TextEditingController();
  TextEditingController addDescController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Initial Selected Value
  String dropdownvalue = 'Fresh Lead';

  // List of items in our dropdown menu
  var items = [
    'Fresh Lead',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                controller: addNoteController,
                autofocus: true,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Add Name',
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
                    padding: const EdgeInsets.symmetric( vertical: 5),
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
              Padding(padding: EdgeInsets.symmetric(vertical: 20,horizontal: 40),
              child: MaterialButton(
                onPressed: () async {
                  final note = addNoteController.text;
                  final description = addDescController.text;
                  if (note.isNotEmpty && description.isNotEmpty) {

                    final collectionRef =
                    FirebaseFirestore.instance.collection('Actions');
                    // make docId Later
                    try {
                      await collectionRef.add({
                        'name': note,
                        'description': description,

                      });
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
              ),)
            ],
          )),
    );
  }
}

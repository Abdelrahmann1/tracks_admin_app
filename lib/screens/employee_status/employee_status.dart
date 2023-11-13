import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/toggle/gf_toggle.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tracks_admin_app/extentions/padding_ext.dart';
import 'package:tracks_admin_app/utils/app_colors.dart';

class EmployeeStatus extends StatefulWidget {
  const EmployeeStatus({super.key});

  @override
  State<EmployeeStatus> createState() => _EmployeeStatusState();
}

class _EmployeeStatusState extends State<EmployeeStatus> {
  String dropdownvalue = 'Pick Topic';
  var items = [
    'Pick Topic',
    'Contacted',
    'Unqualified',
    'Interested',
    'Negotiation',
    'Trash',
    'Done',
  ];
  int seconds = 0, minutes = 0, hours = 0;
  String digitSecond = "00", digitMinutes = "00", digitHours = "00";
  Timer? timer;
  bool started = false;
  List laps = [];
  void stop() {
    timer!.cancel();
    setState(() {
      started = false;
    });
  }

  void start() {
    started = true;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      int localSec = seconds + 1;
      int localMin = minutes;
      int localHours = hours;
      if (localSec > 59) {
        if (localMin > 59) {
          localHours++;
          localMin = 0;
        } else {
          localMin++;
          localSec = 0;
        }
      }
      setState(() {
        seconds = localSec;
        minutes = localMin;
        hours = localHours;
        digitSecond = (seconds >= 10) ? "$seconds" : "0$seconds";
        digitHours = (hours >= 10) ? "$hours" : "0$hours";
        digitMinutes = (minutes >= 10) ? "$minutes" : "0$minutes";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
            title: Text("Status",
                style: GoogleFonts.outfit(
                  color: const Color(0xFF101213),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
          ),
          body: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: AppColors.black26,
                        radius: 40,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.teal,
                        radius: 35,
                        child: Text(
                          "LEARN",
                          style: TextStyle(color: AppColors.white),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: AppColors.black26,
                        radius: 40,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.teal,
                        radius: 35,
                        child: Text(
                          "Teach",
                          style: TextStyle(color: AppColors.white),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: AppColors.black26,
                        radius: 40,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.teal,
                        radius: 35,
                        child: Text(
                          "LEARN",
                          style: TextStyle(color: AppColors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 70,
                width: 150,
                padding: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: DropdownButtonFormField(
                  value: dropdownvalue,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownvalue = newValue!;
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("End",
                      style: GoogleFonts.outfit(
                        color: const Color(0xFF101213),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                  GFToggle(
                    onChanged: (val) {},
                    disabledTrackColor: Colors.teal,
                    enabledTrackColor: Colors.grey,
                    value: true,
                  ),
                  Text("Start",
                      style: GoogleFonts.outfit(
                        color: const Color(0xFF101213),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text("Break",
                  style: GoogleFonts.plusJakartaSans(
                    color: const Color(0xFF101213),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
              const SizedBox(
                height: 15,
              ),
              Text("$digitHours:$digitMinutes:$digitSecond",
                  style: GoogleFonts.plusJakartaSans(
                    color: const Color(0xFF101213),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
              const SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () {
                  (!started) ? start() : stop();
                },
                child: CircleAvatar(
                    radius: 30,
                    child: (!started)
                        ? const Icon(
                            Icons.play_arrow,
                            size: 40,
                          )
                        : const Icon(
                            Icons.pause,
                            size: 40,
                          )),
              ),
              const SizedBox(
                height: 15,
              ),
              Table(
                border:
                    TableBorder.all(width: 0.1), // Add this line to set borders
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,

                children: [
                  TableRow(children: [
                    Text('Name',
                        style: GoogleFonts.plusJakartaSans(
                          color: const Color(0xFF101213),
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        )),
                    const Text(''),
                    Text('Topic',
                        style: GoogleFonts.plusJakartaSans(
                          color: const Color(0xFF101213),
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        )),
                    Text('Start ',
                        style: GoogleFonts.plusJakartaSans(
                          color: const Color(0xFF101213),
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        )),
                    Text('Time ',
                        style: GoogleFonts.plusJakartaSans(
                          color: const Color(0xFF101213),
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        )),
                    Text('Date',
                        style: GoogleFonts.plusJakartaSans(
                          color: const Color(0xFF101213),
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        )),
                  ]),
                  const TableRow(children: [
                    Text(
                      'Ahmed',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Center(
                        child: Text(
                      'L',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    )),
                    Text(
                      'Hello',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      '5:22',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      '6',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        '3/2/20',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ]),
                  const TableRow(children: [
                    Text(
                      'Ahmed',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Center(
                        child: Text(
                      'L',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    )),
                    Text(
                      'Hello',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      '5:22',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      '6',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        '3/2/20',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ]),
                  const TableRow(children: [
                    Text(
                      'Ahmed',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Center(
                        child: Text(
                      'L',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    )),
                    Text(
                      'Hello',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      '5:22',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      '6',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        '3/2/20',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ]),
                  const TableRow(children: [
                    Text(
                      'Ahmed',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Center(
                        child: Text(
                      'L',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    )),
                    Text(
                      'Hello',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      '5:22',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      '6',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        '3/2/20',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ]),
                ],
              ),
            ],
          ).setPageHorizontalPadding(context)),
    );
  }
}

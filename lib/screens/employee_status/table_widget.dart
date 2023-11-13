import 'package:flutter/material.dart';

class EmpTable extends StatelessWidget {
  final String text1;
  final String text2;
  final String text3;
  final String text4;
  final String text5;
  final String text6;



  const EmpTable({
    Key? key,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
    required this.text5, required this.text6,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text1, style: TextStyle(fontSize: 16)),
        Text(text2, style: TextStyle(fontSize: 16)),
        Text(text3, style: TextStyle(fontSize: 16)),
        Text(text4, style: TextStyle(fontSize: 16)),
        Text(text5, style: TextStyle(fontSize: 16)),
        Text(text6, style: TextStyle(fontSize: 16)),


      ],
    );
  }
}


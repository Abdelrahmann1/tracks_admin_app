import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final int buttonColor;
  final String buttonText;
  final Function onTap;
  CustomButton(this.buttonColor, this.buttonText, this.onTap);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Color(buttonColor)),),
      onPressed: ()=> onTap,
      child: Text(buttonText),
    );
  }
}

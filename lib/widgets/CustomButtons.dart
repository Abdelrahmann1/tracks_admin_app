import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final int buttonColor;
  final String buttonText;

  CustomButton(this.buttonColor, this.buttonText);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Color(buttonColor)),
      ),
      onPressed: () {
        // Add your button's functionality here
        print('$buttonText button pressed');
      },
      child: Text(buttonText),
    );
  }
}
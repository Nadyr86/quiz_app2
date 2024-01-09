import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {required this.buttonText,
      required this.onPressed,
      this.bgColor,
      Key? key})
      : super(key: key);
  final VoidCallback onPressed;
  final Color? bgColor;
  final String buttonText;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: bgColor ?? Color(0xffF44336),
              foregroundColor: Colors.white),
          onPressed: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Text(
              buttonText,
              style: TextStyle(fontSize: 26.0, color: Colors.white),
            ),
          )),
    );
  }
}

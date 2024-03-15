import 'package:flutter/material.dart';
import 'package:quiz_app2/app_constants/colors/app_colors.dart';
import 'package:quiz_app2/app_constants/text_styles/app_text_styles.dart';

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
            backgroundColor: bgColor ?? AppColors.secondaryColor,
            foregroundColor: AppColors.white,
          ),
          onPressed: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Text(
              buttonText,
              style: AppTextStyles.buttonStyle,
            ),
          )),
    );
  }
}

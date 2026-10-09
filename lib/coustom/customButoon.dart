

import 'package:chat_app/utilles/utillsHelper.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final Widget textWidget;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final BorderSide mBorderSide;


  const CustomElevatedButton({
    super.key,
    required this.textWidget,
    required this.onPressed,
    this.backgroundColor = Colors.white,
    this.mBorderSide = BorderSide.none,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: Colors.white,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
            side: mBorderSide
          ),
        ),
        child: textWidget,
      ),
    );
  }
}
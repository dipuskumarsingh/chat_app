import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors {
  static final primaryColor = Color(0xffFDC603);
  static final secondaryColor = Color(0xff111111);
  static final buttonColor = Color(0xffEBEBEB);
}

TextStyle mTextStyle12({
  Color mColor = Colors.black,
  mFontWeight = FontWeight.normal,
}) {
  return TextStyle(fontSize: 12, fontWeight: mFontWeight, color: mColor);
}

TextStyle mTextStyle14({
  Color mColor = Colors.black,
  mFontWeight = FontWeight.normal,
}) {
  return TextStyle(fontSize: 14, fontWeight: mFontWeight, color: mColor);
}

TextStyle mTextStyle16({
  Color mColor = Colors.black,
  mFontWeight = FontWeight.normal,
}) {
  return TextStyle(fontSize: 16, fontWeight: mFontWeight, color: mColor);
}

TextStyle mTextStyle18({
  Color mColor = Colors.black,
  mFontWeight = FontWeight.normal,
}) {
  return TextStyle(fontSize: 18, fontWeight: mFontWeight, color: mColor);
}

TextStyle mTextStyle23({
  Color mColor = Colors.black,
  mFontWeight = FontWeight.normal,
}) {
  return TextStyle(fontSize: 23, fontWeight: mFontWeight, color: mColor);
}

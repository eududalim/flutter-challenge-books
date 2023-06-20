import 'package:flutter/material.dart';

const themeColor = Color(0xffA076F2);
const colorText = Color(0xff555555);

TextStyle get textLarge => const TextStyle(
    color: colorText, fontSize: 16, fontWeight: FontWeight.bold);

TextStyle get textMedium => const TextStyle(
    color: colorText, fontSize: 14, fontWeight: FontWeight.normal);

TextStyle get textSmall => TextStyle(
    color: Colors.grey[800], fontSize: 12, fontWeight: FontWeight.w300);

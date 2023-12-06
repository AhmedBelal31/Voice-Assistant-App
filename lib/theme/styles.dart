import 'package:flutter/material.dart';
import 'package:voice_assistant/const.dart';

abstract class Styles {
  static const textStyle30 = TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w800,
      letterSpacing: 1.2,
      fontFamily: fontFamily,);
  static const textStyle25 = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w500,
    fontFamily: fontFamily,
  );
  static const textStyle20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w800,
    fontFamily: fontFamily,
  );
  static const textStyle18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamily,
  );
  static const textStyle16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontFamily: fontFamily,
  );
  static const textStyle14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    fontFamily: fontFamily,
  );
}

const TextStyle textStyle = TextStyle();

import 'package:flutter/material.dart';
import 'package:flutter_engineer/constants/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class TextStyles {
  static get _bold => TextStyle(
      fontWeight: FontWeight.w700,
      fontFamily: FONT_FAMILY,
      height: 1.2,
      letterSpacing: -0.5);

  static get _medium => TextStyle(
      fontWeight: FontWeight.w500,
      fontFamily: FONT_FAMILY,
      height: 1.2,
      letterSpacing: -0.5);

  static get _regular => TextStyle(
      fontWeight: FontWeight.w400,
      fontFamily: FONT_FAMILY,
      height: 1.2,
      letterSpacing: -0.5);


  static TextStyle style11Medium = _medium.copyWith(fontSize: 11.0.sp);
  static TextStyle style12Medium = _medium.copyWith(fontSize: 12.0.sp);

  static TextStyle style13Regular = _regular.copyWith(fontSize: 13.0.sp);
  static TextStyle style13Medium = _medium.copyWith(fontSize: 13.0.sp);
  static TextStyle style14Regular = _regular.copyWith(fontSize: 14.0.sp);
  static TextStyle style14Medium = _medium.copyWith(fontSize: 14.0.sp);
  static TextStyle style15Medium = _medium.copyWith(fontSize: 15.0.sp);
  static TextStyle style15Regular = _regular.copyWith(fontSize: 15.0.sp);
  static TextStyle style20Regular = _regular.copyWith(fontSize: 20.0.sp);
  static TextStyle style32Regular = _regular.copyWith(fontSize: 32.0.sp);
  static TextStyle style32Bold = _bold.copyWith(fontSize: 32.0.sp);
}

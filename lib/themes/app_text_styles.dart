import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../gen/fonts.gen.dart';
import 'app_colors.dart';

class AppTextStyles {
  const AppTextStyles._();

  static const String _fontFamilyDemo = FontFamily.noplatoDemo;
  static const String _fontFamily = FontFamily.alexandria;

  static final TextStyle mono44 = TextStyle(
    fontFamily: _fontFamilyDemo,
    fontSize: 44.0.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.accentThree,
    letterSpacing: 0.0,
    height: 1.13,
  );

  static final TextStyle mono24 = TextStyle(
    fontFamily: _fontFamilyDemo,
    fontSize: 24.0.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.accentThree,
    letterSpacing: 0.0,
    height: 1.25,
  );

  static final TextStyle bold18 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 18.0.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.accentThree,
    letterSpacing: 0.0,
    height: 1.22,
  );

  static final TextStyle medium16 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16.0.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.accentThree,
    letterSpacing: 0.0,
    height: 1.25,
  );

  static final TextStyle regular12 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12.0.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.accentThree,
    letterSpacing: 0.0,
    height: 1.0,
  );

  static final TextStyle light16 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16.0.sp,
    fontWeight: FontWeight.w300,
    color: AppColors.accentThree,
    letterSpacing: 0.0,
    height: 1.25,
  );

  static final TextStyle light14 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14.0.sp,
    fontWeight: FontWeight.w300,
    color: AppColors.accentThree,
    letterSpacing: 0.0,
    height: 1.28,
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTypography {
  // Central font configuration - change this to switch fonts for entire app
  static TextStyle _baseTextStyle(double fontSize, FontWeight fontWeight) {
    return GoogleFonts.poppins(
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
    );
  }

  // Alternative: If you want to easily switch between different fonts
  // Just uncomment one of these and comment out the _baseTextStyle above
  /*
  static TextStyle _baseTextStyle(double fontSize, FontWeight fontWeight) {
    return GoogleFonts.poppins(
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
    );
  }
  */

  /*
  static TextStyle _baseTextStyle(double fontSize, FontWeight fontWeight) {
    return GoogleFonts.inter(
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
    );
  }
  */

  // Extra Light (FontWeight.w300)
  static TextStyle get kExtraLight8 => _baseTextStyle(8, FontWeight.w300);
  static TextStyle get kExtraLight10 => _baseTextStyle(10, FontWeight.w300);
  static TextStyle get kExtraLight14 => _baseTextStyle(14, FontWeight.w300);
  static TextStyle get kExtraLight20 => _baseTextStyle(20, FontWeight.w300);
  static TextStyle get kExtraLight22 => _baseTextStyle(22, FontWeight.w300);
  static TextStyle get kExtraLight24 => _baseTextStyle(24, FontWeight.w300);
  static TextStyle get kExtraLight26 => _baseTextStyle(26, FontWeight.w300);
  static TextStyle get kExtraLight28 => _baseTextStyle(28, FontWeight.w300);

  // Light (FontWeight.w400)
  static TextStyle get kLight6 => _baseTextStyle(6, FontWeight.w400);
  static TextStyle get kLight8 => _baseTextStyle(8, FontWeight.w400);
  static TextStyle get kLight10 => _baseTextStyle(10, FontWeight.w400);
  static TextStyle get kLight12 => _baseTextStyle(12, FontWeight.w400);
  static TextStyle get kLight14 => _baseTextStyle(14, FontWeight.w400);
  static TextStyle get kLight16 => _baseTextStyle(16, FontWeight.w400);
  static TextStyle get kLight18 => _baseTextStyle(18, FontWeight.w400);
  static TextStyle get kLight20 => _baseTextStyle(20, FontWeight.w400);
  static TextStyle get kLight22 => _baseTextStyle(22, FontWeight.w400);
  static TextStyle get kLight24 => _baseTextStyle(24, FontWeight.w400);
  static TextStyle get kLight26 => _baseTextStyle(26, FontWeight.w400);
  static TextStyle get kLight28 => _baseTextStyle(28, FontWeight.w400);
  static TextStyle get kLight30 => _baseTextStyle(30, FontWeight.w400);
  static TextStyle get kLight32 => _baseTextStyle(32, FontWeight.w400);
  static TextStyle get kLight36 => _baseTextStyle(36, FontWeight.w400);

  // Medium (FontWeight.w500)
  static TextStyle get kMedium10 => _baseTextStyle(10, FontWeight.w500);
  static TextStyle get kMedium12 => _baseTextStyle(12, FontWeight.w500);
  static TextStyle get kMedium14 => _baseTextStyle(14, FontWeight.w500);
  static TextStyle get kMedium16 => _baseTextStyle(16, FontWeight.w500);
  static TextStyle get kMedium18 => _baseTextStyle(18, FontWeight.w500);
  static TextStyle get kMedium20 => _baseTextStyle(20, FontWeight.w500);
  static TextStyle get kMedium22 => _baseTextStyle(22, FontWeight.w500);
  static TextStyle get kMedium24 => _baseTextStyle(24, FontWeight.w500);
  static TextStyle get kMedium26 => _baseTextStyle(26, FontWeight.w500);
  static TextStyle get kMedium30 => _baseTextStyle(30, FontWeight.w500);
  static TextStyle get kMedium34 => _baseTextStyle(34, FontWeight.w500);
  static TextStyle get kMedium36 => _baseTextStyle(36, FontWeight.w500);

  // Bold (FontWeight.w600)
  static TextStyle get kBold6 => _baseTextStyle(6, FontWeight.w600);
  static TextStyle get kBold10 => _baseTextStyle(10, FontWeight.w600);
  static TextStyle get kBold12 => _baseTextStyle(12, FontWeight.w600);
  static TextStyle get kBold14 => _baseTextStyle(14, FontWeight.w600);
  static TextStyle get kBold16 => _baseTextStyle(16, FontWeight.w600);
  static TextStyle get kBold18 => _baseTextStyle(18, FontWeight.w600);
  static TextStyle get kBold20 => _baseTextStyle(20, FontWeight.w600);
  static TextStyle get kBold22 => _baseTextStyle(22, FontWeight.w600);
  static TextStyle get kBold24 => _baseTextStyle(24, FontWeight.w600);
  static TextStyle get kBold26 => _baseTextStyle(26, FontWeight.w600);
  static TextStyle get kBold28 => _baseTextStyle(28, FontWeight.w600);
  static TextStyle get kBold30 => _baseTextStyle(30, FontWeight.w600);
  static TextStyle get kBold32 => _baseTextStyle(32, FontWeight.w600);
  static TextStyle get kBold40 => _baseTextStyle(40, FontWeight.w600);

  // Extra Bold (FontWeight.w700)
  static TextStyle get kExtraBold10 => _baseTextStyle(10, FontWeight.w700);
  static TextStyle get kExtraBold12 => _baseTextStyle(12, FontWeight.w700);
  static TextStyle get kExtraBold14 => _baseTextStyle(14, FontWeight.w700);
  static TextStyle get kExtraBold16 => _baseTextStyle(16, FontWeight.w700);
  static TextStyle get kExtraBold18 => _baseTextStyle(18, FontWeight.w700);
  static TextStyle get kExtraBold20 => _baseTextStyle(20, FontWeight.w700);
  static TextStyle get kExtraBold22 => _baseTextStyle(22, FontWeight.w700);
  static TextStyle get kExtraBold24 => _baseTextStyle(24, FontWeight.w700);
  static TextStyle get kExtraBold26 => _baseTextStyle(26, FontWeight.w700);
  static TextStyle get kExtraBold28 => _baseTextStyle(28, FontWeight.w700);
  static TextStyle get kExtraBold30 => _baseTextStyle(30, FontWeight.w700);
  static TextStyle get kExtraBold40 => _baseTextStyle(40, FontWeight.w700);
}

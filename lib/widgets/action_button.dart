import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ronvest_app/utils/global_variables.dart';

//The reusable widget for all buttons
class ActionButton extends StatelessWidget {
  const ActionButton(
      {super.key,
      required this.radius,
      required this.height,
      required this.width,
      required this.label,
      required this.onPressed,
      this.color});
  final double radius, height, width;
  final String label;
  final VoidCallback onPressed;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0.h,
      onPressed: onPressed,
      color: color ?? primaryColor,
      height: height.h,
      minWidth: width.w,
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius).r),
      child: Text(
        label,
        style: GoogleFonts.aBeeZee(
          color: Colors.white,
          fontSize: 17.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}

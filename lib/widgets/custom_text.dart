import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {super.key,
      required this.text,
      required this.size,
      required this.color,
      required this.weight,
      this.align,
      this.style});
  final String text;
  final double size;
  final Color color;
  final FontWeight weight;
  final TextAlign? align;
  final FontStyle? style;
  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      style: GoogleFonts.aBeeZee(
          color: color,
          fontSize: size.sp,
          fontWeight: weight,
          fontStyle: style),
      textAlign: align,
    );
  }
}

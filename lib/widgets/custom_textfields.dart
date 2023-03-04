import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ronvest_app/utils/global_variables.dart';

//A field whose character don't need to be obscured
class ShownRegistrationField extends StatelessWidget {
  const ShownRegistrationField(
      {super.key,
      required this.hint,
      required this.textController,
      this.validator,
      required this.keyInputType});
  final String hint;
  final TextEditingController textController;

  final FormFieldValidator<String>? validator;
  final TextInputType keyInputType;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 76.h,
      width: 340.w,
      child: TextFormField(
        validator: validator,
        keyboardType: keyInputType,
        controller: textController,
        decoration: InputDecoration(
          filled: true,
          fillColor: fieldFillColor,
          helperText: ' ',
          hintText: hint,
          hintStyle: GoogleFonts.aBeeZee(
            color: fieldTextColor,
            fontSize: 15.sp,
            fontWeight: FontWeight.w400,
          ),
          border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.shade300,
              ),
              borderRadius: BorderRadius.circular(10).r),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xffD1D5DB), width: 0),
              borderRadius: BorderRadius.circular(10).r),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: primaryColor,
                width: 1.w,
              ),
              borderRadius: BorderRadius.circular(10).r),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red,
                width: 1.w,
              ),
              borderRadius: BorderRadius.circular(10).r),
        ),
      ),
    );
  }
}

//A field whose characters should not be always visible e.g passwords
class HiddenRegistrationField extends StatelessWidget {
  const HiddenRegistrationField(
      {super.key,
      required this.showText,
      required this.onPress,
      required this.hint,
      required this.textController,
      this.validator,
      required this.keyInputType});
  final bool showText;
  final VoidCallback onPress;
  final String hint;
  final TextEditingController textController;
  final FormFieldValidator<String>? validator;
  final TextInputType keyInputType;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 76.h,
      width: double.infinity.w,
      child: TextFormField(
        validator: validator,
        controller: textController,
        keyboardType: keyInputType,
        obscureText: !showText,
        obscuringCharacter: '*',
        decoration: InputDecoration(
          filled: true,
          fillColor: fieldFillColor,
          helperText: ' ',
          hintText: hint,
          hintStyle: GoogleFonts.aBeeZee(
            color: fieldTextColor,
            fontSize: 15.sp,
            fontWeight: FontWeight.w400,
          ),
          border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.shade300,
              ),
              borderRadius: BorderRadius.circular(10).r),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xffD1D5DB), width: 0),
              borderRadius: BorderRadius.circular(10).r),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: primaryColor,
                width: 1.w,
              ),
              borderRadius: BorderRadius.circular(10).r),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red,
                width: 1.w,
              ),
              borderRadius: BorderRadius.circular(10).r),
          suffixIcon: IconButton(
            onPressed: onPress,
            icon: showText
                ? const Icon(
                    Icons.visibility_off_sharp,
                    color: Colors.grey,
                    size: 20,
                  )
                : const Icon(
                    Icons.visibility_sharp,
                    color: Colors.grey,
                    size: 20,
                  ),
          ),
        ),
      ),
    );
  }
}

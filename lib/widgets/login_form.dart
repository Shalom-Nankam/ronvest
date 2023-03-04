import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ronvest_app/utils/global_variables.dart';

import '../controllers/login_controller.dart';
import '../models/validators.dart';

//Form for login containing the neccessary fields
class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
    required this.control,
  });
  final LoginController control;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: control.loginFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 76.h,
              width: double.infinity.w,
              child: TextFormField(
                validator: (value) => Validators.fieldValidator(value),
                controller: control.loginUsernameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: fieldFillColor,
                  helperText: ' ',
                  hintText: 'Email / Username / Phone',
                  hintStyle: GoogleFonts.aBeeZee(
                    color: fieldTextColor,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey.shade300, width: 0),
                      borderRadius: BorderRadius.circular(10).r),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Color(0xffD1D5DB), width: 0),
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
            ),
            SizedBox(
              height: 76.h,
              width: double.infinity.w,
              child: TextFormField(
                controller: control.loginPasswordController,
                keyboardType: TextInputType.text,
                obscureText: !control.showPassword,
                obscuringCharacter: '*',
                decoration: InputDecoration(
                  filled: true,
                  fillColor: fieldFillColor,
                  helperText: ' ',
                  hintText: 'Password',
                  hintStyle: GoogleFonts.aBeeZee(
                    color: fieldTextColor,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade300,
                      ),
                      borderRadius: BorderRadius.circular(10).r),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Color(0xffD1D5DB), width: 0),
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
                    onPressed: () => control.hidePassword(),
                    icon: control.showPassword
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
            ),
          ],
        ));
  }
}

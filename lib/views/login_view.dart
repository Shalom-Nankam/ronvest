import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ronvest_app/views/stateless_view.dart';
import 'package:ronvest_app/widgets/custom_appbar.dart';
import 'package:ronvest_app/widgets/custom_text.dart';
import 'package:ronvest_app/widgets/login_form.dart';

import '../controllers/login_controller.dart';
import '../widgets/action_button.dart';

class LoginView extends StatelessView<LoginScreen, LoginController> {
  const LoginView(LoginController state, {Key? key}) : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    //watch isSigning variable, if true, show loading indicator
    return Obx(
      () => Scaffold(
        body: controller.authManager.isSigning.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 18.h),
                child: SafeArea(
                    child: SingleChildScrollView(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30.h,
                      ),
                      CustomAppbar(),
                      SizedBox(
                        height: 30.h,
                      ),
                      const CustomText(
                          text: 'Login',
                          size: 32,
                          color: Color(0xff253e4a),
                          style: FontStyle.italic,
                          weight: FontWeight.w400),
                      SizedBox(
                        height: 34.h,
                      ),
                      LoginForm(control: controller),
                      const Align(
                        alignment: Alignment.centerRight,
                        child: CustomText(
                            text: 'Forgot Password?',
                            size: 12,
                            color: Color(0xff1c1939),
                            align: TextAlign.end,
                            weight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 53.h,
                      ),
                      ActionButton(
                          radius: 10,
                          height: 60,
                          width: 333,
                          label: 'Sign in My account',
                          onPressed: () => controller.loginUser()),
                      SizedBox(
                        height: 22.h,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: GestureDetector(
                          onTap: () => controller.toSignUp(),
                          child: const CustomText(
                              text: "Don't have an account? - Sign up",
                              size: 12,
                              color: Color(0xff1c1939),
                              weight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                )),
              ),
      ),
    );
  }
}

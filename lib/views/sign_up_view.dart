import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ronvest_app/views/stateless_view.dart';
import 'package:ronvest_app/widgets/sign_up_form.dart';

import '../controllers/sign_up_controller.dart';
import '../widgets/action_button.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_text.dart';

class SignUpView extends StatelessView<SignUpScreen, SignUpController> {
  const SignUpView(SignUpController state, {Key? key}) : super(state, key: key);

  @override
  Widget build(BuildContext context) {
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
                        height: 20.h,
                      ),
                      CustomAppbar(),
                      SizedBox(
                        height: 30.h,
                      ),
                      const CustomText(
                          text: 'Sign up',
                          size: 32,
                          color: Color(0xff253e4a),
                          style: FontStyle.italic,
                          weight: FontWeight.w400),
                      SizedBox(
                        height: 29.h,
                      ),
                      SignUpForm(control: controller),
                      SizedBox(
                        width: double.infinity.w,
                        height: 40.h,
                        child: Row(
                          children: [
                            //watch state management value -agreedToTermsandConditions
                            Obx(
                              () => Checkbox(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5).r),
                                  side: const BorderSide(color: Colors.grey),
                                  activeColor: const Color(0xff109CF1),
                                  value: controller.authManager
                                      .agreedToTermsAndCondition.value,
                                  onChanged: (value) => controller.authManager
                                      .agreeToTermsAndConditions(value!)),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            const Flexible(
                              flex: 1,
                              child: CustomText(
                                  text:
                                      "By creating your account you have to agree with our Terms and Conditions.",
                                  size: 12,
                                  color: Color(0xff1c1939),
                                  align: TextAlign.left,
                                  weight: FontWeight.w400),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50.h,
                      ),
                      ActionButton(
                          radius: 10,
                          height: 60,
                          width: 333,
                          label: 'Sign up my Account',
                          color: Colors.black,
                          onPressed: () => controller.signUp()),
                      SizedBox(
                        height: 15.h,
                      ),
                      ActionButton(
                          radius: 10,
                          height: 60,
                          width: 333,
                          label: 'Sign up with Phone Number',
                          onPressed: () => controller.signUp()),
                      SizedBox(
                        height: 20.h,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: GestureDetector(
                          onTap: () => controller.toSignIn(),
                          child: const CustomText(
                              text: "Already have an account? - Sign In",
                              size: 12,
                              color: Color(0xff1c1939),
                              align: TextAlign.end,
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

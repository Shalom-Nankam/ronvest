import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ronvest_app/models/register_model.dart';
import 'package:ronvest_app/state_management/auth_manager.dart';
import 'package:ronvest_app/views/sign_up_view.dart';

import 'login_controller.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => SignUpController();
}

class SignUpController extends State<SignUpScreen> {
  //dependency injected previously in login page, so find it
  final AuthManager authManager = Get.find();

  GlobalKey<FormState> signUpFormkey = GlobalKey<FormState>();
  TextEditingController signUpFullNameController = TextEditingController();
  TextEditingController signUpEmailController = TextEditingController();
  TextEditingController signUpPasswordController = TextEditingController();

  late bool showPassword;
  @override
  void initState() {
    showPassword = false;
    super.initState();
  }

  @override
  void dispose() {
    signUpEmailController.dispose();
    signUpPasswordController.dispose();
    signUpFullNameController.dispose();
    super.dispose();
  }

  toSignIn() {
    Get.to(const LoginScreen());
  }

  toggleShowPassword() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  signUp() {
    //if user has not checked the terms and condition button during sign up
    if (!authManager.agreedToTermsAndCondition.value) {
      Get.snackbar('Agree to terms and conditions',
          'Please agree to the terms and conditons',
          colorText: const Color(0xffffffff),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: const Color(0xff000000));
    }
    if (signUpFormkey.currentState!.validate() &&
        authManager.agreedToTermsAndCondition.value) {
      final newUser = RegisterModel(
          username: signUpFullNameController.text,
          email: signUpEmailController.text,
          password: signUpPasswordController.text);

      authManager.userToSignUp = newUser;
      authManager.signUpUser();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SignUpView(this);
  }
}

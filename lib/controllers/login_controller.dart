import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ronvest_app/controllers/sign_up_controller.dart';
import 'package:ronvest_app/state_management/auth_manager.dart';

import '../models/login_model.dart';
import '../views/login_view.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => LoginController();
}

class LoginController extends State<LoginScreen> {
  //authentication state manager first initialization
  final authManager = Get.put(AuthManager());

  //control login form validation
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  TextEditingController loginUsernameController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

  //password field visibility: not visible
  bool showPassword = false;

  //toggle password visibility
  hidePassword() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  @override
  void dispose() {
    loginUsernameController.dispose();
    loginPasswordController.dispose();
    super.dispose();
  }

  toSignUp() {
    Get.to(() => const SignUpScreen());
  }

  loginUser() async {
    //if all fields necessary have been entered
    if (loginFormKey.currentState!.validate()) {
      final logUser = LoginModel(
          username: loginUsernameController.text,
          password: loginPasswordController.text);

      //sign in the user
      authManager.signInUser(logUser);
    }
  }

  @override
  Widget build(BuildContext context) {
    return LoginView(this);
  }
}

import 'package:flutter/material.dart';

import '../controllers/sign_up_controller.dart';
import '../models/validators.dart';
import 'custom_textfields.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key, required this.control});

  final SignUpController control;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: control.signUpFormkey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShownRegistrationField(
              keyInputType: TextInputType.name,
              textController: control.signUpFullNameController,
              validator: (value) => Validators.fieldValidator(value),
              hint: 'Full Name'),
          ShownRegistrationField(
              keyInputType: TextInputType.name,
              textController: control.signUpEmailController,
              validator: (value) => Validators.emailValidator(value),
              hint: 'Email Address'),
          HiddenRegistrationField(
            textController: control.signUpPasswordController,
            keyInputType: TextInputType.text,
            validator: (value) => Validators.passwordValidator(value),
            hint: 'Password',
            onPress: () => control.toggleShowPassword(),
            showText: control.showPassword,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ronvest_app/controllers/home_page_controller.dart';
import 'package:ronvest_app/controllers/login_controller.dart';
import 'package:ronvest_app/models/auth_response.dart';
import 'package:ronvest_app/models/login_model.dart';
import 'package:ronvest_app/models/register_model.dart';
import 'package:ronvest_app/utils/global_variables.dart';

//Handles app wide authentication states
class AuthManager extends GetxController {
  //if user is currently signing in
  var isSigning = false.obs;

//user to be registerd newly, originally empty until a user
//fills in their details
  RegisterModel userToSignUp =
      RegisterModel(username: '', email: '', password: '');

  //the current authenticated user's details
  Map<String, dynamic> currentUser = {};

  //the user profile retrieved from the api response
  Map<String, dynamic> userProfile = {};

  //a string for the date the current user was first created
  String userWasCreated = '';

//has a new user agreed to the terms and conditions during sign up?
  var agreedToTermsAndCondition = false.obs;
  void agreeToTermsAndConditions(bool value) {
    agreedToTermsAndCondition(value);
  }

  signUpUser() async {
    isSigning(true);
    Response serverResponse = await repository.signUpUser(userToSignUp);
    if (isConnectionSuccesful(serverResponse.statusCode!)) {
      final authresponse = AuthResponse.fromMap(serverResponse.body);
      currentUser = authresponse.data;
      //if user has been succesfully registered on backend, then register
      //on firebase as well
      String? firebaseResponse = await repository.registerUserInFirebase(
          email: userToSignUp.email, password: userToSignUp.password);
      if (firebaseResponse == 'Success') {
        //After successful registrations, take the user to login page to sign in
        Get.offAll(() => const LoginScreen());
      } else {
        //If error occured during sign up, show a snackbar with the message
        isSigning(false);
        Get.snackbar('Error', firebaseResponse!,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.black,
            colorText: Colors.white);
        return;
      }
    } else {
      final authresponse = AuthResponse.fromMap(serverResponse.body);
      isSigning(false);
      Get.snackbar('Error', authresponse.message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.black,
          colorText: Colors.white);
      return;
    }
    isSigning(false);
  }

  signInUser(LoginModel user) async {
    isSigning(true);
    Response serverResponse = await repository.signInUser(user);
    if (isConnectionSuccesful(serverResponse.statusCode!)) {
      AuthResponse authresponse = AuthResponse.fromMap(serverResponse.body);
      currentUser = authresponse.data;
      //Sign a user in on firebase depending on their information gotten from
      //the backend
      String? firebaseResponse = await repository.signInFirebase(
          email: currentUser["user_info"]["email"], password: user.password);
      if (firebaseResponse == 'Success') {
        //if signed in successfully, take them to the home page
        Get.offAll(() => const HomePageScreen());
      } else {
        isSigning(false);
        Get.snackbar('Error', firebaseResponse!,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.black,
            colorText: Colors.white);
        return;
      }
    } else {
      AuthResponse authresponse = AuthResponse.fromMap(serverResponse.body);
      isSigning(false);
      Get.snackbar('Error', authresponse.message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.black,
          colorText: Colors.white);
      return;
    }
    isSigning(false);
  }

//get the current user's profile from api service
  getProfile() async {
    Response serverResponse = await repository.getProfile(
        currentUser["access_token"], currentUser["user_id"]);
    if (isConnectionSuccesful(serverResponse.statusCode!)) {
      userProfile = serverResponse.body;
      //change the format of date the user was created in api response
      //to closely match that on the design
      final date = DateTime.parse(userProfile["data"]["created_at"]);
      userWasCreated = DateFormat('yMMMMd').format(date);
      return;
      // AuthResponse authresponse = AuthResponse.fromMap(serverResponse.body);
      // currentUser = authresponse.data;
      // Get.offAll(() => const UserProfileScreen());
    } else {
      AuthResponse authresponse = AuthResponse.fromMap(serverResponse.body);
      isSigning(false);
      Get.snackbar('Error', authresponse.message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.black,
          colorText: Colors.white);
      return;
    }
  }

//check if a network request was successful by analysing the response status code
  bool isConnectionSuccesful(int statusCode) {
    return statusCode == 201 || statusCode == 200;
  }
}
